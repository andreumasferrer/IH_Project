class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def authorize_user
    unless current_user
      flash[:message] = 'Please log in or register to access this page'
      redirect_to root_path 
    end
  end
end
