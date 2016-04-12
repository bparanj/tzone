class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :set_user_time_zone
  
  protected
  
  def set_user_time_zone
    Time.zone = current_user.time_zone if logged_in?
  end
  
  def current_user
    User.find(session[:user_id]) rescue User.new
  end
  
  def logged_in?
    !session[:user_id].blank?
  end
end
