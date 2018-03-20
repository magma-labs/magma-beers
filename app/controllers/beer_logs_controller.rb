class BeerLogsController < ApplicationController
  respond_to :html
  before_action :set_beer_log, except: [:index,:new,:create]
  before_action :authenticate_user!

  def show
  end

  def create
    @beerlog = current_user.beer_logs.new(beer_log_params)
    if @beerlog.save
      flash[:success] =  "Created successfully !!"
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
    @pagination = BeerLog.by_user(current_user).all.page(params[:page])
    @beerlogs = @pagination.group_by(&:log_date)
  end

  def edit
  end

  def update
    if @beerlog.update_attributes(beer_log_params)
      flash[:success] =  "Updated successfully !!"
      redirect_to user_root_path
    else
      flash[:alert] = @beerlog.errors.full_messages.join
      render :edit
    end
  end

  def destroy
    @beerlog.destroy
    if @beerlog.destroyed?
      flash[:success] =  "Deleted successfully !!"
      redirect_to user_root_path
    else
      flash[:alert] = @beerlog.errors.full_messages.join
      render :edit
    end
  end

  private

  def beer_log_params
    params.require(:beer_log).permit(:beer_id, :quantity, :log_date)
  end

  def set_beer_log
    @beerlog = BeerLog.find(params[:id])
  end
end
