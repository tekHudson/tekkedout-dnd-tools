class CombatantController < ApplicationController
  def index
    @combatants = Combatant.all.order(:name)
  end

  def new
    @combatant = Combatant.new
    render :edit
  end
end
