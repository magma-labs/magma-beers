class ImageDownloaderJob
  include Sidekiq::Worker

  sidekiq_options queue: :default

  def perform(id)
    beer = Beer.find_by(id: id)
    io = open(URI.parse(beer.photo_remote_url))
    beer.photo = io
    beer.save!
  end
end
