class ApplicationController < ActionController::Base
  include Facebooker2::Rails::Controller
  
  protect_from_forgery
  
  layout 'application'
  
  def current_user
    session[:current_user] ||= Mogli::User.find('me', current_facebook_client)
  end
  helper_method :current_user
  
end
