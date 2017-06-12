require_relative "../import_spells"

desc "Import spells from files"
task :import => :environment do
  ImportSpells.construct_spells("bard.csv")
  ImportSpells.construct_spells("cleric.csv")
  ImportSpells.construct_spells("druid.csv")
  ImportSpells.construct_spells("paladin.csv")
  ImportSpells.construct_spells("ranger.csv")
  ImportSpells.construct_spells("sorcerer.csv")
  ImportSpells.construct_spells("warlock.csv")
  ImportSpells.construct_spells("wizard.csv")
  ImportSpells.update_all_components
end
