class Spell < ApplicationRecord
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/PerceivedComplexity
  def self.all_for_display(klass = nil, name = nil, description = nil)
    klass.downcase!
    name.downcase!
    description.downcase!

    if klass && name && description
      return where("? = ANY (klass)", klass).where("lower(name) LIKE ? ", name)
                                            .where("lower(description) LIKE ? ", description)
    elsif klass && description
      return where("? = ANY (klass)", klass).where("lower(description) LIKE ? ", description)
    elsif klass && name
      return where("? = ANY (klass)", klass).where("lower(name) LIKE ? ", name)
    elsif name && description
      return where("lower(name) LIKE ? ", name).where("lower(description) LIKE ? ", description)
    elsif klass
      return where("? = ANY (klass)", klass)
    elsif description
      return where("lower(description) LIKE ? ", description)
    elsif name
      return where("lower(name) LIKE ? ", name)
    else
      return all
    end
  end
end
