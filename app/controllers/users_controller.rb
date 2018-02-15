class UsersController < ApplicationController
    before_action :authenticate_user!
    
   #GET vers /users/:id
  def show
    @user = User.find( params[:id] )
  end
  
end