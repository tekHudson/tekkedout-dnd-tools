class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private_class_method def self.active_tab(tab, *options)
    before_action(*options) { @active_tab = tab }
  end
end
