class Creature < ApplicationRecord
  before_save :update_modifiers

  STAT_COLS = %w[str dex con int wis cha].freeze
  STAT_MOD_COLS = %w[str_mod dex_mod con_mod int_mod wis_mod cha_mod].freeze

  def self.generate_combatant_stats(creature_id)
    results = {}
    creature = Creature.find creature_id

    results[:name] = creature.name || nil
    results[:init] = Roll.d20 + creature.dex_mod || nil
    results[:max_hp] = creature.hp || nil
    results[:hp] = creature.hp || nil
    results[:ac] = creature.ac || nil

    results
  end

  private

  def update_modifiers
    self.str_mod = modifier(str) if str.present?
    self.dex_mod = modifier(dex) if dex.present?
    self.con_mod = modifier(con) if con.present?
    self.int_mod = modifier(int) if int.present?
    self.wis_mod = modifier(wis) if wis.present?
    self.cha_mod = modifier(cha) if cha.present?
  end

  def modifier(score)
    (score - 10) / 2
  end
end
