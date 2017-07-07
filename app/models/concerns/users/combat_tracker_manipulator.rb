module Users
  module CombatTrackerManipulator
    extend ActiveSupport::Concern

    def can_edit_tracker?(ct)
      id == ct.user_id
    end

    def update_combat_tracker(params)
      transaction do
        ct = CombatTracker.includes(:combatants).find(params[:id])
        ct.update(params)
        ct.save!
        ct
      end
    end
  end
end
