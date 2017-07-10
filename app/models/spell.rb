class Spell < ApplicationRecord
  validates :level, :name, :description, :klass, presence: true

  # rubocop:disable Metrics/CyclomaticComplexity
  def self.all_for_display(klass = nil, name = nil)
    klass.capitalize! if klass
    name.downcase! if name
    klass_and_name = klass.present? && name.present?

    return where("? = ANY (klass)", klass.to_s).where("lower(name) ILIKE ?", "%#{name}%") if klass_and_name
    return where("? = ANY (klass)", klass.to_s) if klass.present?
    return where("lower(name) ILIKE ?", "%#{name}%") if name.present?
    all
  end
end
