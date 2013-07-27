class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper

  #required for rails 4
  #config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
  def not_authenticated
  	redirect_to new_session_path, alert: "Please log in!"
  end
  
end
