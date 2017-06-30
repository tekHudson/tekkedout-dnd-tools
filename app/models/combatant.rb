class Combatant < ApplicationRecord
  # :name, :init, :max_hp, :hp, :ac, :dc
  belongs_to :combat_tracker
  before_save :strip_fields

  private

  def strip_fields
    strip_name
    strip_init
    strip_max_hp
    strip_hp
    strip_ac
    strip_dc
  end

  def strip_name
    name.strip if name
  end

  def strip_init
    init.strip if init
  end

  def strip_max_hp
    max_hp.strip if max_hp
  end

  def strip_hp
    hp.strip if hp
  end

  def strip_ac
    ac.strip if ac
  end

  def strip_dc
    dc.strip if dc
  end
end
