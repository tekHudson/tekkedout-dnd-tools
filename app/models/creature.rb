class Creature < ApplicationRecord
  before_save :update_modifiers

  STAT_COLS = %w[str dex con int wis cha].freeze
  STAT_MOD_COLS = %w[str_mod dex_mod con_mod int_mod wis_mod cha_mod].freeze

  def self.build_stats(creature_id, qty)
    results = []
    creature = Creature.find creature_id

    (1..qty.to_i).each do |n|
      creature_name = creature.name
      creature_name += " #{n}" if qty.to_i > 1
      results << { name: creature_name,
                   init: Roll.d20 + creature.dex_mod,
                   max_hp: creature.hp,
                   hp: creature.hp,
                   ac: creature.ac }
    end

    results
  end

  private

  def update_modifiers
    update_str_mod
    update_dex_mod
    update_con_mod
    update_int_mod
    update_wis_mod
    update_cha_mod
  end

  def update_str_mod
    self.str_mod = modifier(str) if str.present?
  end

  def update_dex_mod
    self.dex_mod = modifier(dex) if dex.present?
  end

  def update_con_mod
    self.con_mod = modifier(con) if con.present?
  end

  def update_int_mod
    self.int_mod = modifier(int) if int.present?
  end

  def update_wis_mod
    self.wis_mod = modifier(wis) if wis.present?
  end

  def update_cha_mod
    self.cha_mod = modifier(cha) if cha.present?
  end

  def modifier(score)
    (score - 10) / 2
  end
end
