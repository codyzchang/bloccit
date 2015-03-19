class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
<<<<<<< HEAD
=======
  before_action :flash_attack, only: [:index, :show, :edit, :new]
>>>>>>> 69d7ad68ce1517be132e4e6e7a79027ddf672f0b
 
   rescue_from Pundit::NotAuthorizedError do |exception|
     redirect_to root_url, alert: exception.message
   end
  
  
  
  
   protected
 
  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) << :name
  end
  
  def flash_attack
    flash.now[:notice] = "Authentication Assignment"
  end
  
  
end
