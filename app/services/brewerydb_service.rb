# frozen_string_literal: true

require 'httparty'
class BrewerydbService
  include HTTParty
  base_uri ENV.fetch('BREWERYDB_APIURL')

  def initialize(available_id, page)
    @options = {
      query: { availableId: available_id, p: page, key: ENV.fetch('BREWERYDB_APIKEY')}
    }
  end

  def beers
    self.class.get('/v2/beers', @options)
  end

end
