class Spell < ApplicationRecord
  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/PerceivedComplexity
  def self.all_for_display(klass = nil, name = nil)
    klass.capitalize! if klass
    name.downcase! if name

    if klass.present? && name.present?
      return where("? = ANY (klass)", klass.to_s).where("lower(name) ILIKE ?", "%#{name}%")
    elsif klass.present?
      return where("? = ANY (klass)", klass.to_s)
    elsif name.present?
      return where("lower(name) ILIKE ?", "%#{name}%")
    else
      return all
    end
  end
end
