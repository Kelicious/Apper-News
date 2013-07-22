class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery

  def handle_unverified_request
    sign_out
    super
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in"
    end
  end
end
