class CreaturesController < ApplicationController
  active_tab "creatures"

  def index
    @creatures = Creature.all
  end
end
