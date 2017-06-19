class CombatTrackersController < ApplicationController
  active_tab "combat_tracker"

  def index
    @combat_trackers = CombatTracker.not_deleted
    @deleted_trackers = CombatTracker.deleted
  end

  def new
    @new_combatant = Combatant.new
    @combat_tracker = CombatTracker.new

    render :edit
  end

  def edit
    @combat_tracker = CombatTracker.find(params[:id])
    @new_combatant = Combatant.new
  end

  def update
    # puts params.inspect
    ct = CombatTracker.includes(:combatants).find(params[:id])

    if ct.update(combat_tracker_params)
      redirect_to edit_combat_tracker_path(ct), flash: { success: "Tracker updated!" }
    else
      redirect_to edit_combat_tracker_path(ct), alert: ct.errors.full_messages.to_sentence
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

  def deleted
    @combat_trackers = CombatTracker.deleted

    render :index
  end

  private

  def combat_tracker_params
    params.require(:combat_tracker).permit(:name, combatants_attributes: [:id, :name, :init, :max_hp, :hp, :ac, :dc])
  end
end
