class BeerLogsController < ApplicationController
  respond_to :html
  before_action :set_beer_log, except: [:index,:new,:create]
  before_action :authenticate_user!

  def show
  end

  def create
    @beerlog = current_user.beer_logs.new(beer_log_params)
    if @beerlog.save
      flash[:success] =  "Created!"
     redirect_to user_root_path
    else
      flash[:alert] = @beerlog.errors.full_messages.join
      render :new
    end

  end

  def new
    @beerlog = BeerLog.new
  end

  def index
    @beerlogs = BeerLog.all
  end

  def edit
  end

  def update
    if @beerlog.update_attributes(beer_log_params)
      redirect_to user_root_path
    else
      flash[:alert] = @beerlog.errors.full_messages.join
      render :edit
    end
  end
  def destroy
    @beerlog.destroy
    if @beerlog.destroyed?
      redirect_to user_root_path
    else
      render :edit
    end
  end

  private
  def beer_log_params
    params.require(:beer_log).permit(:beer_id, :quantity)
  end
  def set_beer_log
    @beerlog = BeerLog.find(params[:id])
  end
end
