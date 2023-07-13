module DonationHelper
  NEXT_BUTTON = 'siguiente'
  DONATE = 'Donar'

  def success_donor_amount_form
    first('input[type="radio"]').choose
    click_button NEXT_BUTTON
  end

  def success_donor_info_form(donor)
    fill_in 'donor_info_form_first_name', with: donor.first_name
    fill_in 'donor_info_form_last_name', with: donor.last_name
    fill_in 'donor_info_form_email', with: donor.email
    fill_in 'donor_info_form_phone_number', with: donor.phone_number
    fill_in 'donor_info_form_birthdate', with: DateTime.now
    click_button NEXT_BUTTON
  end

  def success_payment_method_form(donor)
    find('#payment_method_form_franchise').find(:xpath, 'option[2]').select_option
    fill_in 'payment_method_form_card_number', with: Faker::Finance.credit_card(:mastercard, :visa)
    fill_in 'payment_method_form_security_code', with: Faker::Base.numerify('###')
    fill_in 'payment_method_form_expiration_date', with: DateTime.now + 1.year
    find('#payment_method_form_document_type').find(:xpath, 'option[2]').select_option
    fill_in 'payment_method_form_document_number', with: donor.document_number
    click_button DONATE
  end

  def wait_for_donations_creation
    Timeout.timeout(10) do
      loop until ActionMailer::Base.deliveries.any?
    end
  rescue Timeout::Error
    raise 'timed out'
  end
end
