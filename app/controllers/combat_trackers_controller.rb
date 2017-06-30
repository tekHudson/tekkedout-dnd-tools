class CombatTrackersController < ApplicationController
  active_tab "combat_tracker"

  def index
    @new_combat_tracker = CombatTracker.new
    @combat_trackers = CombatTracker.not_deleted
  end

  def new
    @combat_tracker = CombatTracker.new
  end

  def create
    ct_params = combat_tracker_params
    ct = CombatTracker.create! ct_params

    redirect_to edit_combat_tracker_path(ct)
  end

  def edit
    @combat_tracker = CombatTracker.find(params[:id])
    @creatures = Creature.all.collect { |c| [c.name, c.id] }
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

    if params[:restore]
      ct.deleted_at = nil
      ct.save!

      redirect_to combat_trackers_path, flash: { success: "Tracker successfully restored!" }
    else
      if ct.soft_delete
        redirect_to combat_trackers_path, flash: { success: "Tracker successfully deleted!" }
      else
        redirect_to :back, alert: ct.errors.full_messages.to_sentence
      end
    end
  end

  def deleted
    @new_combat_tracker = CombatTracker.new
    @combat_trackers = CombatTracker.deleted

    render :index
  end

  def add_combatant
    add_params = add_combatant_params
    ct = CombatTracker.find(add_params[:id])
    ct.add_combatant(add_params[:creature_id], add_params[:creature_qty])

    redirect_to edit_combat_tracker_path(ct)
  end

  private

  def add_combatant_params
    params.permit(:id, :creature_id, :creature_qty)
  end

  def combat_tracker_params
    params.require(:combat_tracker).permit(:name, combatants_attributes: %i[id name init max_hp hp ac dc])
  end
end
