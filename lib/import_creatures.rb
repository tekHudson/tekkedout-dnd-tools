require 'csv'

class ImportCreatures
  MONSTER_COL_NAMES = %i(name species size alignment ac hp speed str dex con int wis cha saving_throws skills damage_immunities damage_resistance condition_immunities senses languages chalange xp book page)

  def self.scrape_file(file_name)
    begin
      path_to_file = File.join(File.dirname(__FILE__), file_name)

      CSV.foreach(path_to_file, headers: true, encoding:'iso-8859-1:utf-8') do |row|
        # skip labels row
        next if $INPUT_LINE_NUMBER == 1

        creature_hash = {}

        MONSTER_COL_NAMES.each_with_index do |element, i|
          next if row[i].nil?

          creature_hash[element] = row[i]
        end

        exisiting_creature = Creature.where(name: creature_hash[:name]).first
        next if exisiting_creature.present?

        creature_hash[:speed] = split_to_array(creature_hash[:speed])
        creature_hash[:saving_throws] = split_to_array(creature_hash[:saving_throws])
        creature_hash[:skills] = split_to_array(creature_hash[:skills])
        creature_hash[:damage_resistance] = split_to_array(creature_hash[:damage_resistance])
        creature_hash[:damage_immunities] = split_to_array(creature_hash[:damage_immunities])
        creature_hash[:condition_immunities] = split_to_array(creature_hash[:condition_immunities])
        creature_hash[:senses] = split_to_array(creature_hash[:senses])
        creature_hash[:languages] = split_to_array(creature_hash[:languages])
        Creature.create creature_hash
      end
    rescue => e
      puts "Exception: #{e.inspect}"
    end
  end

  private

  def self.split_to_array(string)
    if string.present?
      string.split(",")
    else
      []
    end
  end
end
