class ApplicationController < ActionController::Base
  add_flash_types :danger, :info, :warning, :success, :messages

  def access_denied(exception)
    redirect_to admin_dashboard_path, alert: exception.message
  end
  
  # private
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:role_id,:full_name, :gender, :age, :contact, :usernname])    
  # end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :current_password])
  end
  
end
