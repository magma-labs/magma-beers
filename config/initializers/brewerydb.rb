$brewery_db = BreweryDB::Client.new do |config|
  config.api_key = ENV['BREWERYDB_APIKEY']
  config.logger = Rails.logger
end
