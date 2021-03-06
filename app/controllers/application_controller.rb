class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] && User.where(id: session[:user_id]).first
  end
  helper_method :current_user
end
