class CombatTrackersController < ApplicationController
  def index
    @characters = Character.all
    @character = Character.new
  end
end
