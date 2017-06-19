class CombatantsController < ApplicationController
  def create
    combatant_params = combatant_params(params)

    Combatant.create! combatant_params

    redirect_to edit_combat_tracker_path(combatant_params[:combat_tracker_id])
  end

  def destroy
    combatant = Combatant.find(params[:id])

    if combatant.destroy
      redirect_to edit_combat_tracker_path(combatant.combat_tracker_id), flash: { success: "Tracker successfully deleted!" }
    else
      redirect_to :back, alert: combatant.errors.full_messages.to_sentence
    end
  end

  private

  def combatant_params(params)
    params.require(:combatant).permit(:combat_tracker_id, :name, :init, :max_hp, :hp, :ac, :dc)
  end
end
