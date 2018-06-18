require_relative "../import_creatures"

desc "Import creatures from file"
task import_creatures: :environment do
  ImportCreatures.scrape_file("lib/seeds/creature_list.txt")
end
