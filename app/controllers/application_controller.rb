class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_time_zone

  def set_time_zone
    config.time_zone = 'Central Time (US & Canada)'
  end

  private

  def require_login!
    unless current_user
      redirect_to "/users/sign_in"
    end
  end
end
