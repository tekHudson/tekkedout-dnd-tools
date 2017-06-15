require 'csv'

class ImportSpells
  SPELL_DETAILS = %i(level name sub_klass casting_time range components duration description klass)

  def initialize
    @spells = []
  end

  def self.construct_spells(file_name)
    begin
      spells_by_name = {}

      path_to_file = File.join(File.dirname(__FILE__), file_name)

      CSV.foreach(path_to_file, headers: true, encoding:'iso-8859-1:utf-8') do |row|
        spell_hash = {}

        SPELL_DETAILS.each_with_index do |element, i|
          next if row[i].nil?

          if element == :klass
            spell_hash[element] = row[i].gsub(/(,)/, '')
          else
            spell_hash[element] = row[i].gsub(/""/, '"')
          end
        end

        exisiting_spell = Spell.where(name: spell_hash[:name]).first

        if exisiting_spell.present?
          exisiting_spell.klass.push spell_hash[:klass]
          exisiting_spell.sub_klass.push spell_hash[:sub_klass]
          exisiting_spell.save!
        else
          spell_hash[:klass] = [spell_hash[:klass]]
          spell_hash[:sub_klass] = [spell_hash[:sub_klass]]
          Spell.create spell_hash
        end
      end
    rescue => e
      puts "Unable to complete #{file_name}"
      puts "Exception: #{e.inspect}"
    end
  end

  def self.update_all_components
    Spell.all.each do |spell|
      spell.components = spell.components.gsub(/(V)/, 'Verbal').gsub(/(S)/, 'Somatic').gsub(/(M)/, 'Material')
      spell.save!
    end
  end
end
