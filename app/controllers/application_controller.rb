class ApplicationController < ActionController::Base
  add_flash_types :danger, :info, :warning, :success, :messages
  before_action :configure_permitted_parameters, if: :devise_controller?

  def access_denied(exception)
    redirect_to admin_dashboard_path, alert: exception.message
  end
  
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role_id,:full_name, :gender, :age, :contact])    
  end
end
