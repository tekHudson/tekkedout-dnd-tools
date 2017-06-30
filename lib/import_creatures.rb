require "csv"

class ImportCreatures
  CREATURE_COL_NAMES = %i[name species size alignment ac hp speed str dex con int wis cha
                          saving_throws skills damage_immunities damage_resistance
                          condition_immunities senses languages chalange xp book page].freeze
  CREATURE_INFO_AS_ARRAY = %i[speed saving_throws skills damage_resistance damage_immunities
                              condition_immunities senses languages].freeze

  def self.scrape_file(file_name)
    path_to_file = File.join(File.dirname(__FILE__), file_name)

    CSV.foreach(path_to_file, headers: true, encoding: "iso-8859-1:utf-8") do |row|
      # skip labels row
      next if $INPUT_LINE_NUMBER == 1
      @creature_hash = {}
      populate_creature_hash(row)
      next if Creature.where(name: @creature_hash[:name]).first.present?
      split_strings_in_creature_hash

      Creature.create @creature_hash
    end
  rescue => e
    Rails.logger.error "Exception: #{e.inspect}"
  end

  class << self
    def self.split_strings_in_creature_hash
      CREATURE_INFO_AS_ARRAY.each do |element|
        @creature_hash[element] = split_to_array(@creature_hash[element])
      end
    end

    def self.populate_creature_hash
      CREATURE_COL_NAMES.each_with_index do |element, i|
        next if row[i].nil?

        @creature_hash[element] = row[i]
      end
    end

    def self.split_to_array(string)
      if string.present?
        string.split(",")
      else
        []
      end
    end
  end
end
