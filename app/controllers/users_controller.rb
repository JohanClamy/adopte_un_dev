class UsersController < ApplicationController
    
   #GET vers /users/:id
  def show
    @user = User.find( params[:id] )
  end
  
end