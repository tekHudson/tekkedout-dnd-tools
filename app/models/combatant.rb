class Combatant < ApplicationRecord
  # :name, :init, :max_hp, :hp, :ac, :dc
  belongs_to :combat_tracker
  before_save :strip_name

  private

  def strip_name
    name.strip if name
  end
end
