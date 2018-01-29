class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end
    
    def create
        @contact = Contact.new(contact_params)
        if @contact.save
          name = params[:contact][:nom]
          email = params[:contact][:email]
          body = params[:contact][:message]
          ContactMailer.contact_email(name,email,body).deliver
          flash[:success] ="Merci! Votre message a bien été envoyé.Nous y répondrons dés que possible."
          redirect_to new_contact_path
        else
          flash[:danger] = @contact.errors.full_messages.join(", ")
          redirect_to new_contact_path
        end
     end
     
     private
        def contact_params
          params.require(:contact).permit(:nom, :email,:message)
        end
end