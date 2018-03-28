require 'httparty'
require 'httplog'
class BrewerydbService
  include HTTParty
  base_uri 'api.brewerydb.com'

  def initialize(available_id, page)
    @options = { query: { availableId: available_id, p: page, key: ENV['BREWERYDB_APIKEY']} }
  end

  def beers
    self.class.get('/v2/beers', @options)
  end

end
