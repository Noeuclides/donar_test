class Admin::BaseController < ApplicationController
  layout 'admin'
  include Pagy::Backend
  before_action :authenticate_admin!
end
