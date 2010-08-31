class ApplicationController < ActionController::Base
  include Facebooker2::Rails::Controller
  
  protect_from_forgery
  
  layout 'application'
  
  def current_user
    cached_facebook_user(current_facebook_user[:id])
  end
  helper_method :current_user
  
  protected
  
  def cached_facebook_user(id)
    if value = Rails.cache.read(id)
      value
    else
      value = Mogli::User.find(id, current_facebook_client)
      Rails.cache.write(id, value, :expires_in => 30.minutes)
      value
    end
  end
  
end
