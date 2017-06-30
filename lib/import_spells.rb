require "csv"

class ImportSpells
  SPELL_DETAILS = %i[level name sub_klass casting_time range components duration description klass].freeze

  def initialize
    @spells = []
  end

  def self.construct_spells(file_name)
    path_to_file = File.join(File.dirname(__FILE__), file_name)

    CSV.foreach(path_to_file, headers: true, encoding: "iso-8859-1:utf-8") do |row|
      @spell_hash = {}

      populate_spell_hash(row)

      update_or_create_spell
    end
  rescue => e
    Rails.logger.error "Unable to complete #{file_name}"
    Rails.logger.error "Exception: #{e.inspect}"
  end

  def self.populate_spell_hash(row)
    SPELL_DETAILS.each_with_index do |element, i|
      next if row[i].nil?
      @spell_hash[element] = element == :klass ? row[i].gsub(/(,)/, "") : row[i].gsub(/""/, '"')
    end
  end

  def self.update_or_create_spell
    exisiting_spell = Spell.where(name: @spell_hash[:name]).first

    if exisiting_spell.present?
      update_existing_spell
    else
      create_spell
    end
  end

  def self.create_spell
    @spell_hash[:klass] = [@spell_hash[:klass]]
    @spell_hash[:sub_klass] = [@spell_hash[:sub_klass]]
    Spell.create @spell_hash
  end

  def self.update_existing_spell
    exisiting_spell.klass.push @spell_hash[:klass]
    exisiting_spell.sub_klass.push @spell_hash[:sub_klass]
    exisiting_spell.save!
  end

  def self.update_all_components
    Spell.all.each do |spell|
      spell.components = spell.components.gsub(/(V)/, "Verbal").gsub(/(S)/, "Somatic").gsub(/(M)/, "Material")
      spell.save!
    end
  end
end
