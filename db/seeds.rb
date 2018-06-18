Rake::Task["import_spells"].invoke

Rake::Task["import_creatures"].invoke

unless Rails.env.production?
  ActionMailer::Base.perform_deliveries = false

  admin = User.create(email: "site_admin@fake.com", password: "Password1", password_confirmation: "Password1")
  admin.confirm
  admin.save!

  ActionMailer::Base.perform_deliveries = true

  COMBATANT_NAMES = "Harry Potter, Hermione Granger, Professor Severus Snape, Lord Voldemort,
                     Draco Malfoy, Ron Weasley, Professor Albus Dumbledore, Dobby the House Elf,
                     Newt Scamander, Gellert Grindelwald, Sorting Hat, Bellatrix Lestrange,
                     James Potter, Ginny Weasley, Remus Lupin, Sirius Black, Cho Chang, Nagini,
                     Hedwig, Rubeus Hagrid, Luna Lovegood, Neville Longbottom,
                     Professor Minerva McGonagall, Nicholas Flamel".split(",")

  # Random value generator
  def random_stat_value
    rand(5..20)
  end

  (1..10).each do |i|
    ct = CombatTracker.new
    ct.name = "Test tracker #{i}"
    ct.user_id = admin.id
    ct.deleted_at = Time.zone.today - i.days if (i % 3).zero?
    ct.save!
    (1..rand(2..5)).each do |_n|
      combatant = Combatant.new
      combatant.combat_tracker_id = ct.id
      combatant.name = COMBATANT_NAMES.sample.strip
      combatant.init = random_stat_value
      combatant.max_hp = random_stat_value
      combatant.hp = random_stat_value
      combatant.ac = random_stat_value
      combatant.dc = random_stat_value
      combatant.save!
    end
  end
end
