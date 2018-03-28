require 'sidekiq-scheduler'

class SyncBeerCatalogJob
  include Sidekiq::Worker

  sidekiq_options queue: :default

  def perform
    @options = stored_options
    @current_state = @options['beers']['state']
    @current_available = @options['beers']['available_id']
    @current_available_idx = 0
    @current_page = @options['beers']['page']
    @total_pages = nil
    @beers = []

    @available = brewery_db.menu.beer_availability || []
    @available_ids =  @available.take(@available.size)
      .select { |a| a['id'] >= @current_available }.map { |a| a['id'] }
    sync_catalog
  end

  private

  def sync_catalog
    status = {
      state: @current_state,
      in_last_available: is_last_available?,
      in_last_page: is_last_page?
    }
    send(state_actions[status])
  end

  def init_parameters
    @current_state = 1
    @current_available = @available_ids.first
    @current_page = 1
    sync_catalog
  end

  def nex_page
    if request_beers
      @current_page += 1
      sync_catalog
    else
      save_beers
      save_parameters
    end
  end

  def next_available
    if request_beers
      @current_page = 1
      @current_available_idx += 1
      @current_available = @available_ids[@current_available_idx]
      sync_catalog
    else
      save_beers
      save_parameters
    end
  end

  def finish_sync
    if request_beers
      save_beers
      @current_state = 0
      @current_available = 0
      @current_page = 0
    end
    save_parameters
  end

  def request_beers
    serv = ::BrewerydbService.new(@current_available, @current_page)
    response = serv.beers
    if response.code == 200
      body_response = JSON.parse(response.body)
      @total_pages = body_response['numberOfPages']
      body_response['data'].each do |beer|
        @beers << {
          api_id: beer['id'],
          name: beer['name'],
          description: (beer['description'] && beer['description'] || ''),
          style: (beer['style'] && beer['style']['name'] || nil),
          year: (beer['year'] && beer['year'] || nil),
          abv: (beer['abv'] && beer['abv'] || nil),
          ibu: (beer['ibu'] && beer['ibu'] || nil),
          photo_remote_url: (beer['labels'] && beer['labels']['large'] || nil)
        } if !local_beers.include?(beer['id'])
      end
      return true
    end
    return false
  end

  def save_beers
    Beer.create(@beers)
  end

  def save_parameters
    @options['beers']['state'] = @current_state
    @options['beers']['available_id'] = @current_available
    @options['beers']['page'] = @current_page
    File.open("#{Rails.root}/brewery_sync.yml", 'w') { |f| YAML.dump(@options, f) }
  end

  def local_beers
    @local_beers ||= Beer.where('api_id IS NOT NULL').map { |beer| beer.api_id }
  end

  def brewery_db
    @brewery_db ||= BreweryDB::Client.new do |config|
      config.api_key = ENV.fetch('BREWERYDB_APIKEY')
      config.logger = Rails.logger
    end
  end

  def stored_options
    YAML.load_file "#{Rails.root}/brewery_sync.yml"
  end

  def state_actions
    @state_action ||= {
      { state: 0, in_last_available: false, in_last_page: false } => 'init_parameters',
      { state: 1, in_last_available: false, in_last_page: false } => 'nex_page',
      { state: 1, in_last_available: false, in_last_page: true } => 'next_available',
      { state: 1, in_last_available: true, in_last_page: false } => 'nex_page',
      { state: 1, in_last_available: true, in_last_page: true } => 'finish_sync'
    }
  end

  def is_last_available?
    @available_ids.last == @current_available
  end

  def is_last_page?
    @current_state != 0 && @current_page == @total_pages
  end
end
