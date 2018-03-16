class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :set_data

  def index
    @beerlog = BeerLog.new
  end

  def catch_404
    raise ActionController::RoutingError.new(params[:path])
  end

  private

  def set_data
    @beerlogs = BeerLog.where("user_id = ? and created_at >= ?",
      current_user.id,Time.zone.now.beginning_of_day).order(:id)
  end
end
