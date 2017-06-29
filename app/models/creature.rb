class Creature < ApplicationRecord
  before_save :update_modifiers

  STAT_COLS = %w(str dex con int wis cha)
  STAT_MOD_COLS = %w(str_mod dex_mod con_mod int_mod wis_mod cha_mod)

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
    self.str_mod = modifier(self.str) if self.str.present?
    self.dex_mod = modifier(self.dex) if self.dex.present?
    self.con_mod = modifier(self.con) if self.con.present?
    self.int_mod = modifier(self.int) if self.int.present?
    self.wis_mod = modifier(self.wis) if self.wis.present?
    self.cha_mod = modifier(self.cha) if self.cha.present?
  end

  def modifier(score)
    (score - 10) / 2
  end
end