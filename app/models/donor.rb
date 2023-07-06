# == Schema Information
#
# Table name: donors
#
#  id              :bigint           not null, primary key
#  birthdate       :datetime
#  discarded_at    :datetime
#  document_number :string
#  document_type   :string
#  email           :string
#  first_name      :string
#  last_name       :string
#  phone_number    :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_donors_on_discarded_at  (discarded_at)
#
class Donor < ApplicationRecord
  include Discard

  has_many :donations, class_name: Donation.name
  has_many :payment_methods, as: :holder,  class_name: PaymentMethod.name

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :document_number, uniqueness: true
  validates :phone_number, uniqueness: true

end
