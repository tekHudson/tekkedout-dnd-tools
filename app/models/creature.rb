class Creature < ApplicationRecord
  has_many :combatants

  before_save :update_modifiers

  STAT_COLS = %w[str dex con int wis cha].freeze
  STAT_MOD_COLS = %w[str_mod dex_mod con_mod int_mod wis_mod cha_mod].freeze

  def self.build_stats(creature_id, qty)
    results = []
    creature = Creature.find creature_id

    (1..qty.to_i).each do |n|
      creature_name = creature.name
      creature_name += " #{n}" if qty.to_i > 1
      results << { creature_id: creature.id,
                   name: creature_name,
                   init: Roll.d20 + creature.dex_mod,
                   max_hp: creature.hp,
                   hp: creature.hp,
                   ac: creature.ac }
    end

    results
  end

  def str_mod_with_symbol
    str_mod >= 0 ? "+#{str_mod}" : str_mod.to_s
  end

  def dex_mod_with_symbol
    dex_mod >= 0 ? "+#{dex_mod}" : dex_mod.to_s
  end

  def con_mod_with_symbol
    con_mod >= 0 ? "+#{con_mod}" : con_mod.to_s
  end

  def int_mod_with_symbol
    int_mod >= 0 ? "+#{int_mod}" : int_mod.to_s
  end

  def wis_mod_with_symbol
    wis_mod >= 0 ? "+#{wis_mod}" : wis_mod.to_s
  end

  def cha_mod_with_symbol
    cha_mod >= 0 ? "+#{cha_mod}" : cha_mod.to_s
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
