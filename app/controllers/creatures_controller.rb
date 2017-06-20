class CreaturesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  active_tab "creatures"

  def index
    @creatures = Creature.all
  end
end
