class CreateDonorService
  def initialize(params)
    @params = params
  end

  def create
    existing_donor = Donor.find_by_document_number @params[:document_number]
    existing_donor.nil? ? Donor.create!(@params) : Donor.update!(@params)
  end
end