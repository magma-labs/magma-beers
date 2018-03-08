class BeersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_beer, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      @beers = Beer.where('name LIKE ?', "%#{params[:search]}%")
    else
      @beers = Beer.all
    end
  end

  def show
  end

  def new
    @beer = Beer.new
  end

  def create
    @beer = Beer.new(beer_params)

    if @beer.save
      redirect_to @beer, notice: 'The beer was created successfully.'
    else
      render :new
    end
  end

  private
    def set_beer
      @beer = Beer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def beer_params
      params.require(:beer).permit(:name, :description, :photo, :status, :abv, :ibu, :search)
    end

end

