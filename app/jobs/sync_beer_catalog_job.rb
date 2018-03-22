class SyncBeerCatalogJob < ApplicationJob
  include Sidekiq::Worker
  # queue_as :default

  sidekiq_options queue: :default

  def perform(*args)
  end
end
