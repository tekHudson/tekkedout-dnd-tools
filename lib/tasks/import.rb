desc "Import spells from files"
task :import do
  spell_importer = ImportSpells.new
  spell_importer.construct_spells("../assets/paladin.csv")
end
