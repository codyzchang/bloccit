class UsersController < ApplicationController
   before_action :authenticate_user!
 
   def update
     if current_user.update_attributes(user_params)
       flash.now[:notice] = "User information updated"
       redirect_to edit_user_registration_path
     else
       flash.now[:error] = "Invalid user information"
       redirect_to edit_user_registration_path
     end
   end
 
  private
 
   def user_params
     params.require(:user).permit(:name, :avatar)
   end
 end