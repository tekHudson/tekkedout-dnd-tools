require 'csv'

class ImportSpells
  SPELL_DETAILS = %i(level name sub_class casting_time range components duration description other)

  def initialize
    @spells = []
  end

  def construct_spells(file_name)
    spells_by_name = {}

    path_to_file = File.join(File.dirname(__FILE__), file_name)

    CSV.foreach(path_to_file, headers: true, encoding:'iso-8859-1:utf-8') do |row|
      combined_cells = ""

      (0..30).each do |i|
        next if row[i].nil?
        combined_cells += row[i]
      end

      split_info = combined_cells.split(";")
      spell_hash = Hash[ *(SPELL_DETAILS.zip(split_info).flatten) ]

      Spell.create spell_hash
    end

    p spells_by_name
  end
end
