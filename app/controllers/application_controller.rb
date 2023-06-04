class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :require_login, unless: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  private

  def require_login
    return if user_signed_in?

    flash[:error] = 'You must be logged in to access this section'
    redirect_to new_user_session_path # halts request cycle
  end
end
