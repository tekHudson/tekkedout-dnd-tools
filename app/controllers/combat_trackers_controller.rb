class CombatTrackersController < ApplicationController
  active_tab "combat_tracker"

  def index
    @new_combat_tracker = CombatTracker.new
    @combat_trackers = CombatTracker.not_deleted_for(current_user)
  end

  def new
    @combat_tracker = CombatTracker.new
  end

  def create
    ct = CombatTracker.create! combat_tracker_params.merge(user_id: current_user.id)

    redirect_to edit_combat_tracker_path(ct)
  end

  def edit
    ct = CombatTracker.find(params[:id])
    redirect_to combat_trackers_path unless current_user.can_edit_tracker?(ct)

    @combat_tracker = ct
    @creatures = Creature.all.collect { |c| [c.name, c.id] }
  end

  def update
    ct = current_user.update_combat_tracker(combat_tracker_params)

    if ct
      redirect_to edit_combat_tracker_path(ct), flash: { success: "Tracker updated!" }
    else
      redirect_to :back, alert: ct.errors.full_messages.to_sentence
    end
  end

  def restore
    ct = CombatTracker.find(params[:id])
    ct.restore

    redirect_to combat_trackers_path, flash: { success: "Tracker successfully restored!" }
  end

  def destroy
    ct = CombatTracker.find(params[:id])
    redirect_to combat_trackers_path unless current_user.can_edit_tracker?(ct)

    if ct.soft_delete
      redirect_to combat_trackers_path, flash: { success: "Tracker successfully deleted!" }
    else
      redirect_to :back, alert: ct.errors.full_messages.to_sentence
    end
  end

  def deleted
    @new_combat_tracker = CombatTracker.new
    @combat_trackers = CombatTracker.deleted

    render :index
  end

  def add_creature
    add_params = add_creature_params
    ct = CombatTracker.find(add_params[:id])
    ct.add_creatures(add_params[:creature_id], add_params[:creature_qty])

    redirect_to edit_combat_tracker_path(ct)
  end

  private

  def add_creature_params
    params.permit(:id, :creature_id, :creature_qty)
  end

  def combat_tracker_params
    params.require(:combat_tracker).permit(:id, :name, combatants_attributes: %i[id name init max_hp hp ac dc])
  end
end
