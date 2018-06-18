class CreaturesController < ApplicationController
  skip_before_action :authenticate_user!

  active_tab "creatures"

  def index
    @creatures = Creature.includes(:actions, :traits).all
  end
end
