class CombatTrackersController < ApplicationController
  def index
    @character = Character.new
    @characters = {}
  end
end
