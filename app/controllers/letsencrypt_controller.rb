class LetsencryptController < ApplicationController
  skip_before_action :authenticate_user!

  def authenticate_key
    render text: "#{params[:id]}.#{ENV["LETSENCRYPT_KEY"]}"
  end
end
