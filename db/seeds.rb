# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Random value generator
def random_value
  (rand * (5 - 0.01) + 0.01).round(2)
end

if Spell.all.count < 400
  Rake::Task['import'].invoke
end

(1..10).each do |i|
  ct = CombatTracker.new
  ct.name = "Test tracker #{i}"
  ct.save
end
