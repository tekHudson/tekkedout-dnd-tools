require_relative "../import_spells"

desc "Import spells from files"
task :import => :environment do
  spell_importer = ImportSpells.new
  spell_importer.construct_spells("paladin.csv")
end
