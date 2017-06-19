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

  def to_json
    {
      id: id,
      name: name,
      combatants: combatants.sort_by(&:id).map(&:to_json),
    }.to_json
  end

  def self.to_json
    includes(:combatants).order(:id).all.map(&:to_json).to_json
  end

end
