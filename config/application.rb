require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Chisto
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.generators do |g|
      g.helper = false
      g.assets = false
    end

    # TODO: remove in 5.1
    config.active_record.time_zone_aware_types = [:datetime, :time]

    config.time_zone = 'Europe/Moscow'

    ActiveSupport::JSON::Encoding.time_precision = 0
  end
end
