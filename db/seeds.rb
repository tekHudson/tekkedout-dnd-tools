# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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

Rake::Task["import_spells"].invoke if Spell.all.count < 400

Rake::Task["import_creatures"].invoke if Creature.all.count < 431

User.create(email: "site_admin@fake.com", password: "Password1", password_confirmation: "Password1")
User.create(email: "site_user@fake.com", password: "Password1", password_confirmation: "Password1")

user = User.where(email: "site_admin@fake.com").first

(1..10).each do |i|
  ct = CombatTracker.new
  ct.name = "Test tracker #{i}"
  ct.user_id = user.id
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

