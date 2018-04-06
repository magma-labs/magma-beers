require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
Dotenv::Railtie.load
HOSTNAME = ENV['HOSTNAME']

module MagmaBeers
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.to_prepare do
      # Configure single controller layout
      Devise::SessionsController.layout "devise"
    end

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :options]
      end
    end

    config.autoload_paths += %W(#{config.root}/lib)
    config.active_job.queue_adapter = :sidekiq
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
