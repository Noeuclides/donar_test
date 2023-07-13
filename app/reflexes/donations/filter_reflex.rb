# frozen_string_literal: true

class Donations::FilterReflex < ApplicationReflex
  def search_status
    facet do |filter|
      filter.status = element[:value]
    end
  end

  def search_campaign
    facet do |filter|
      filter.campaign = element[:value]
    end
  end

  def search_payment_date_start
    facet do |filter|
      filter.payment_date_start = element[:value]
    end
  end

  def search_payment_date_end
    facet do |filter|
      filter.payment_date_end = element[:value]
    end
  end

  def paginate
    facet do |filter|
      filter.page = element.dataset.page
    end
  end

  private

  def facet
    filter = DonationsFilter.find(element.dataset.filter)
    yield filter

    filter.save
    pagy, items = pagy(filter.scope, page: filter.page, items: filter.items)
    morph "#items_list", render(Admin::Donations::Table::Component.new(options: { filter: filter, items: items }))
    morph "#paginator", render(Admin::Paginator::Component.new(options: { pagy: pagy, reflex_action: "click->#{self.class.name}#paginate", filter: filter }))
  end
end
