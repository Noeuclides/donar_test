class CreateDonorService
  def initialize(params)
    @params = params
  end

  def create
    existing_donor = Donor.find_by_document_number @params[:document_number]
    if existing_donor.nil?
      Donor.create!(@params)
    else
      existing_donor.update!(@params)
      existing_donor
    end
  end
end