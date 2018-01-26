class Contact < ActiveRecord::Base
  validates :nom, presence: true
  validates :email, presence: true
  validates :message, presence: true
end