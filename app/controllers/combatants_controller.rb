class CombatantsController < ApplicationController
  def create
    combatant_params = combatant_params

    Combatant.create! combatant_params

    redirect_to edit_combat_tracker_path(combatant_params[:combat_tracker_id])
  end

  def update
    combatant = Combatant.find(params[:id])

    if combatant.update(combatant_params)
      redirect_to edit_combat_tracker_path(combatant.combat_tracker_id)
    else
      redirect_to edit_combat_tracker_path(ct), alert: ct.errors.full_messages.to_sentence
    end
  end

  def delete
    combatant = Combatant.find(params[:id])

    if combatant.destroy
      msg = "Tracker successfully deleted!"
      redirect_to edit_combat_tracker_path(combatant.combat_tracker_id), flash: { success: msg }
    else
      redirect_to :back, alert: combatant.errors.full_messages.to_sentence
    end
  end

  private

  def combatant_params
    params.require(:combatant).permit(:combat_tracker_id, :name, :init, :max_hp, :hp, :ac, :dc)
  end
end
