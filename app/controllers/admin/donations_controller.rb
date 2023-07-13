class Admin::DonationsController < Admin::BaseController
  before_action :set_donation, only: %i[ edit update destroy ]

  def index
    @filter = DonationsFilter.find_by(id: params[:filter_id].to_s) || DonationsFilter.new

    @pagy, @items = pagy(@filter.scope, page: @filter.page, items: @filter.items)
    @filter.save
  end

  def destroy
    @donation.discard!
    redirect_to admin_donations_path, status: :see_other

  end

  def edit
  end

  def update
    if @donation.update(donation_params)
      redirect_to admin_donations_path, status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_donation
    @donation = Donation.find(params[:id])
  end

  def donation_params
    permited_params = params.require(:donation)
                            .permit(:amount, :payment_date, :status, :campaign_id, :payment_method_id)
    permited_params[:status] = permited_params[:status].to_i if permited_params[:status].present?
    permited_params
  end
end
