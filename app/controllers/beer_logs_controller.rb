class BeerLogsController < ApplicationController
  before_action :authenticate_user!# , except: [:show,:index]
  # before_action :set_beer_log, except: [:index]
  def show
  end

  def new
  end

  def index
    @beerlogs = BeerLog.all
  end

  def edit
  end

  private
  def set_beer_log
     # @beerlog = BeerLog.find(params[:id])
  end
end
