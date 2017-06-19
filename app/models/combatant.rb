class Combatant < ApplicationRecord
  # :name, :init, :max_hp, :hp, :ac, :dc
  belongs_to :combat_tracker
  before_save :strip_fields

  def to_json
    {
      id: id,
      name: name,
      init: init,
      max_hp: max_hp,
      hp: hp,
      ac: ac,
      dc: dc,
    }
  end

  private

  def strip_fields
    name = name.strip if name
    init = init.strip if init
    max_hp = max_hp.strip if max_hp
    hp = hp.strip if hp
    ac = ac.strip if ac
    dc = dc.strip if dc
  end
end
