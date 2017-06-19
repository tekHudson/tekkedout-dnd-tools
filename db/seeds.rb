# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

COMBATANT_NAMES = "Harry Potter, Hermione Granger, Professor Severus Snape, Lord Voldemort, Draco Malfoy, Ron Weasley, Professor Albus Dumbledore, Dobby the House Elf, Newt Scamander, Gellert Grindelwald, Sorting Hat, Bellatrix Lestrange, James Potter, Ginny Weasley, Remus Lupin, Sirius Black, Cho Chang, Nagini, Hedwig, Rubeus Hagrid, Luna Lovegood, Neville Longbottom, Professor Minerva McGonagall, Nicholas Flamel".split(",")

# Random value generator
def random_stat_value
  rand(5..20)
end

if Spell.all.count < 400
  Rake::Task['import_spells'].invoke
end

if Creature.all.count < 431
  Rake::Task['import_creatures'].invoke
end

(1..10).each do |i|
  ct = CombatTracker.new
  ct.name = "Test tracker #{i}"
  ct.deleted_at = Date.today - i.days if (i % 3 == 0)
  ct.save!
  (1..rand(2..5)).each do |n|
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
