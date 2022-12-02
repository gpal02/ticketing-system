class ApplicationController < ActionController::Base
  add_flash_types :danger, :info, :warning, :success, :messages
  before_action :configure_permitted_parameters, if: :devise_controller?


  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :gender, :age, :contact])    
  end
end
