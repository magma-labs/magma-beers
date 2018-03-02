require 'sidekiq'
require 'sidekiq-scheduler'


if (defined?(Rails::Server) || defined?(Puma))
  Sidekiq.configure_server do |config|
    config.on(:startup) do
      Sidekiq.schedule = YAML.load_file(File.expand_path("#{Rails.root}/config/scheduler.yml", __FILE__))
      Sidekiq::Scheduler.reload_schedule!
    end
  end
end
