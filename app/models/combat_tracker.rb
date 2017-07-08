class CombatTracker < ApplicationRecord
  belongs_to :user
  has_many :combatants, autosave: true
  accepts_nested_attributes_for :combatants

  def mark_deleted
    self.deleted = true
  end

  def self.deleted
    unscoped.where.not(deleted_at: nil)
  end

  def self.not_deleted_for(user)
    where(deleted_at: nil).where(user_id: user.id)
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

  def add_creatures(creature_id, qty)
    creatures = Creature.build_stats(creature_id, qty)
    return unless creatures

    creatures.each do |c|
      combatants.build c
      save!
    end
  end
end
