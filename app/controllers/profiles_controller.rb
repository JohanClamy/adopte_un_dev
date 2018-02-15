class ProfilesController < ApplicationController
    
    
    #GET vers /users/:user_id/profile/new
    def new
        #Render blank profile details form
        @profile = Profile.new
    end
    
    #POST vers /users/:user_id/profile
    def create
      # Ensure that we have the user who is filling out form
      @user = User.find( params[:user_id] )
      # Create profile linked to this specific user
      @profile = @user.build_profile( profile_params )
     if  @profile.save
       flash[:success] = "Profil mise à jour"
       redirect_to user_path(id: params[:user_id])
      else
        render action: :new
     end
    end
    
    #GET vers /users/:user_id/profile/edit
    def edit
      @user= User.find( params[:user_id] )
      @profile = @user.profile
    end
    
      # PATCH to /users/:user_id/profile
      def update
        # Retrieve that user's profile
        @user = User.find( params[:user_id] )
        @profile = @user.profile
        # Mass assign edited profile attributes and save (update)
        if @profile.update_attributes(profile_params)
          flash[:success] = "Profile updated!"
          # Redirect user to their profile page
          redirect_to user_path(id: params[:user_id] )
        else
          render action: :edit
          
        end
      end
      
      private
        def profile_params
          params.require(:profile).permit(:first_name, :avatar, :last_name, :job_title, :phone_number, :contact_email, :description)   
        end
end