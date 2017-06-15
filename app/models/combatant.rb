class Combatant < ApplicationRecord
  # :name, :init, :max_hp, :hp, :ac, :dc
  belongs_to :combat_tracker

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
end
