require "csv"

class ImportCreatures

  class << self
    def scrape_file(file_with_path)
      creature_col_names = %w(
        size monster_type alignment hp ac speed challenge_rating xp
        str str_mod dex dex_mod con con_mod int int_mod wis wis_mod cha cha_mod
        saving_throws skills vulnerabilities UNKNOWN_1 damage_resistance
        damage_immunities condition_immunities passive_perception
        senses languages traits actions ATTACK_DAMAGE_1 ATTACK_DAMAGE_2
        ATTACK_DAMAGE_3 ATTACK_DAMAGE_4 ATTACK_DAMAGE_5 reactions legendary_actions
        ATTACK_DAMAGE_6 UNKNOWN_2
      )

      file = File.read(Rails.root.join(file_with_path))
      creatures_json = JSON.parse file

      creatures_json.each do |j_obj|
        c = Creature.find_or_initialize_by(name: j_obj["n"])

        values = Hash[creature_col_names.zip(j_obj["c"])]
        creature_values = values.select { |k,_| Creature.column_names.include?(k) }
        creature_values.reject! { |_,v| v == "\u2014" }

        c.update! creature_values

        if values["traits"].present? && values["traits"] != "\u2014"
          traits_as_array = hash_keys_to_sym(JSON.parse(values["traits"]))

          traits_as_array.each do |trait|
            Trait.find_or_create_by(creature: c, name: trait[:name], desc: trait[:desc])
          end
        end

        if values["actions"].present? && values["actions"] != "\u2014"
          actions_as_array = hash_keys_to_sym(JSON.parse(values["actions"]))

          actions_as_array.each do |action|
            a = Action.find_or_initialize_by(creature: c, name: action.delete(:name))
            action[:attack_type] = "#{action.delete(:type)} #{action.delete(:type_attack)}" if action[:type].present?
            a.update! action
          end
        end

        if values["reactions"].present? && values["reactions"] != "\u2014"
          reactions_as_array = hash_keys_to_sym(JSON.parse(values["reactions"]))

          reactions_as_array.each do |trait|
            Reaction.find_or_create_by(creature: c, name: trait[:name], desc: trait[:desc])
          end
        end

        if values["legendary_actions"].present? && values["legendary_actions"] != "\u2014"
          legendary_actions_as_array = hash_keys_to_sym(JSON.parse(values["legendary_actions"]))

          legendary_actions_as_array.each do |trait|
            Reaction.find_or_create_by(creature: c, name: trait[:name], desc: trait[:desc])
          end
        end
      end
    end

    private

    def hash_keys_to_sym(hash_to_modify)
      hash_to_modify.map do |action|
        keys = action.keys.map { |e| e.gsub(" ", "_").downcase.to_sym }
        values = action.values
        Hash[keys.zip(values)]
      end
    end

    def split_strings_in_creature_hash
      CREATURE_INFO_AS_ARRAY.each do |element|
        @creature_hash[element] = split_to_array(@creature_hash[element])
      end
    end

    def populate_creature_hash(row)
      CREATURE_COL_NAMES.each_with_index do |element, i|
        next if row[i].nil?
        @creature_hash[element] = row[i]
      end
    end

    def split_to_array(string)
      if string.present?
        string.split(",")
      else
        []
      end
    end
  end
end
