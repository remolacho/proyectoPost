class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  
  def current_user
  	@id_session = session[:user_id]
    @current_user ||= Usuario.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

end
