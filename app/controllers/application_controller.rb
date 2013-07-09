class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery

  #
  def handle_unverified_request
    sign_out
    super
  end

  def signed_in_user
    store_location
    redirect_to signin_url, notice: "Please sign in" unless signed_in?
  end
end
