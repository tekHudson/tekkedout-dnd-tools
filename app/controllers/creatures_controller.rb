class CreaturesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  active_tab "creatures"

  def index
    @creatures = Creature.all
  end

  # def create
  #   creature = Creature.new(creatures_params)

  #   if creature.save
  #     flash[:success] = "Creature '#{creature.name}' added!"
  #   else
  #     flash[:error] = "#{creature.errors.full_messages.join('. ')}.  Please try again."
  #   end
  #   redirect_to combat_trackers_path
  # end

  # def update
  #   creature = Creature.find(params[:id])

  #   creature.assign_attributes creatures_params

  #   if creature.save
  #     redirect_to combat_trackers_path, flash: { success: "Creature '#{creature.name}' updated!" }
  #   else
  #     redirect_to :back, alert: creature.errors.full_messages.to_sentence
  #   end
  # end

  # def destroy
  #   creature = Creature.find(params[:id])
  #   creature.destroy!

  #   redirect_to combat_trackers_path, flash: { success: "Creature successfully deleted!" }
  # end

  # private

  # def creatures_params
  #   params.require(:creature).permit(:name, :init, :max_hp, :hp, :ac, :dc)
  # end
end
