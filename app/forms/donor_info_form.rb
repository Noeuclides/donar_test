class DonorInfoForm < ApplicationForm
  include ActiveModel::Model

  attr_accessor :first_name, :last_name, :email, :phone_number, :birthdate

  validates :first_name, :last_name, :email, :phone_number, :birthdate, presence: true

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_number, presence: true, numericality: true, length: { :minimum => 10, :maximum => 15 }

end
