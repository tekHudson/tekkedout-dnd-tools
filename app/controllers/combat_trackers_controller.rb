class CombatTrackersController < ApplicationController
  def index
    @combat_trackers = CombatTracker.not_deleted
    @deleted_trackers = CombatTracker.deleted
  end

  def update
    ct = CombatTracker.find(params[:id])

    ct.assign_attributes combat_tracker_params

    if ct.save
      redirect_to combat_trackers_path, flash: { success: "Tracker updated!" }
    else
      redirect_to :back, alert: ct.errors.full_messages.to_sentence
    end
  end

  def destroy
    ct = CombatTracker.find(params[:id])

    if ct.soft_delete
      redirect_to combat_trackers_path, flash: { success: "Tracker successfully deleted!" }
    else
      redirect_to :back, alert: ct.errors.full_messages.to_sentence
    end
  end


  private

  def combat_tracker_params
    params.require(:combat_tracker).permit(:name)
  end
end
