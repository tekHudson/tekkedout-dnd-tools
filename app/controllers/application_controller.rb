class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # protect_from_forgery with: :exception
  # protect_from_forgery with: :null_session

  private

  private_class_method def self.active_tab(tab, *options)
    before_action(*options) { @active_tab = tab }
  end
end
