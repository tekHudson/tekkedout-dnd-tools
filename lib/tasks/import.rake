require_relative "../import_spells"

desc "Import spells from files"
task :import => :environment do
  spell_importer = ImportSpells.new
  spell_importer.construct_spells("bard.csv")
  spell_importer.construct_spells("cleric.csv")
  spell_importer.construct_spells("druid.csv")
  spell_importer.construct_spells("paladin.csv")
  spell_importer.construct_spells("ranger.csv")
  spell_importer.construct_spells("sorcerer.csv")
  spell_importer.construct_spells("warlock.csv")
  spell_importer.construct_spells("wizard.csv")
end
