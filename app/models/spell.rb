class Spell < ApplicationRecord
  def self.all_for_display
    Spell.all.order(:name).each_slice(10).to_a
  end
end
