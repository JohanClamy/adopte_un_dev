class Contact < ActiveRecord::Base
  #Validation pour le formulaire de contact
  validates :nom, presence: true
  validates :email, presence: true
  validates :message, presence: true
end