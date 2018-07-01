class RacesController < ApplicationController
  skip_before_action :authenticate_user!

  active_tab "races"

  def dragonborn
  end
end
