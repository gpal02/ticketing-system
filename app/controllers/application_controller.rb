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
      devise_parameter_sanitizer.permit(:sign_up,
        keys: [:username, :contact, :name, :email, :password, :password_confirmation])
      devise_parameter_sanitizer.permit(:sign_in,
        keys: [:login, :contact, :password, :password_confirmation])
      devise_parameter_sanitizer.permit(:account_update,
        keys: [:username, :contact, :name, :email, :password_confirmation, :current_password])
    end

end
