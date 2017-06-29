class CombatTracker < ApplicationRecord
  has_many :combatants, autosave: true
  accepts_nested_attributes_for :combatants

  def mark_deleted
    self.deleted = true
  end

  def self.deleted
    unscoped.where.not(deleted_at: nil)
  end

  def self.not_deleted
    where(deleted_at: nil)
  end

  def soft_delete
    self.deleted_at = Time.zone.now
    save
  end

  def restore
    self.deleted_at = nil
    save!
  end

  def deleted?
    deleted_at != nil
  end

  def add_combatant(creature_id, qty)
    (1..qty.to_i).each do |n|
      combatant_stats = Creature.generate_combatant_stats(creature_id)
      self.combatants.build combatant_stats
      save!
    end
  end
end
