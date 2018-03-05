class BeersController < ApplicationController

  before_action :authenticate_user!

  def index

    @beers = $brewery_db.search.beers(q: 'Corona')
    # .beers.find('Tecate')
    # puts @beers

  end

end

