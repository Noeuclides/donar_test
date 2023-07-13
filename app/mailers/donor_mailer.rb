class DonorMailer < ApplicationMailer
  def donation_successful(donor)
    mail(to: donor.email, subject: 'Gracias por tu donación!')
  end
end
