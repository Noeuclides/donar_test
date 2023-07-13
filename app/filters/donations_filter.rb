# :nocov:
class DonationsFilter < AllFutures::Base
  # Facets
  attribute :payment_date_start, :datetime
  attribute :payment_date_end, :datetime
  attribute :status, :string
  attribute :campaign, :integer

  # Pagination
  attribute :items, :integer, default: 3
  attribute :page, :integer, default: 1

  # Sorting
  attribute :order, :string, default: "created_at"
  attribute :direction, :string, default: "desc"

  def scope
    _scope = Donation.where(
      payment_date: payment_date_start..(payment_date_end ? payment_date_end + 1.day : payment_date_end)
    )

    _scope = _scope.where(status: status) if status.present?

    _scope = _scope.where(campaign: campaign) if campaign.present?

    _scope.order(order => direction)
  end
end

# :nocov: