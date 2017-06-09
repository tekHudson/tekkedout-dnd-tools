class CharactersController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    character = Character.new(characters_params)

    if character.save
      flash[:success] = "Character '#{character.name}' added!"
    else
      flash[:error] = "#{character.errors.full_messages.join('. ')}.  Please try again."
    end
    redirect_to combat_trackers_path
  end

  def update
    character = Character.find(params[:id])

    character.assign_attributes characters_params

    if character.save
      redirect_to combat_trackers_path, flash: { success: "Character '#{character.name}' updated!" }
    else
      redirect_to :back, alert: character.errors.full_messages.to_sentence
    end
  end

  def destroy
    character = Character.find(params[:id])
    character.destroy!

    redirect_to combat_trackers_path, flash: { success: "Character successfully deleted!" }
  end

  private

  def characters_params
    params.require(:character).permit(:name, :init, :max_hp, :hp, :ac, :dc)
  end
end
