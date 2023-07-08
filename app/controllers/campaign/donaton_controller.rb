class Campaign::DonatonController < ApplicationController
  def index
    @form = DonationAmountForm.new
  end
end
