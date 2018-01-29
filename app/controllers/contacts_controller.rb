class ContactsController < ApplicationController
    
    #GET request to /nous-contacter
    #Affiche un nouveau formulaire de contact
    def new
        @contact = Contact.new
    end
    
    #POST request /contacts
    def create
        #Affectation des champs de formulaire dans l'objet de contact
        @contact = Contact.new(contact_params)
        #Enregistrement de l'objet de contact dans la base de donnée
        if @contact.save
          # Stockage des champs du formulaire via paramaters
          #dans des variables temporaires
          name = params[:contact][:nom]
          email = params[:contact][:email]
          body = params[:contact][:message]
          #Envoie les variables dans la méthode Contact Mailer
          #et envoie un email
          ContactMailer.contact_email(name,email,body).deliver
          #Enregistre le message succes dans un flash hash
          #Et redirige vers un formulaire vierge
          flash[:success] ="Merci! Votre message a bien été envoyé.
          Nous y répondrons dés que possible."
          redirect_to new_contact_path
        else
          # Si l'objet contacte n'est pas enregistrer
          #Enregistre les erreurs dans un flash hash
          #Et redirige vers un formulaire vierge 
          flash[:danger] = @contact.errors.full_messages.join(", ")
          redirect_to new_contact_path
        end
     end
     
     private
        # Pour collecter les données venant du formulaire,nous devons utiliser
        #strong parameters et protéger les champs du formulaire
        def contact_params
          params.require(:contact).permit(:nom, :email,:message)
        end
end