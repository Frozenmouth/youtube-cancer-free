# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

require 'google/apis'
require 'google/apis/youtube_v3'

config.cache_store = :redis_store, "redis://localhost:6379/0/cache", { expires_in:  1.day }

config.action_dispatch.rack_cache = {
  metastore: "redis://localhost:6379/1/metastore",
  entitystore: "redis://localhost:6379/1/entitystore"
}

sentinel_config = {
  url: "redis://mymaster/0",
  role: "master",
  sentinels: [{
    host: "127.0.0.1",
    port: 26379
  },{
    host: "127.0.0.1",
    port: 26380
  },{
    host: "127.0.0.1",
    port: 26381
  }]
}

config.cache_store = :redis_store, sentinel_config.merge(
  namespace: "cache",
  expires_in: 1.days
)
config.session_store :redis_store, {
  servers: [
    sentinel_config.merge(
      namespace: "sessions"
    )
  ],
  expire_after: 2.days
}

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module YTCF
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.log_level = :debug
    Google::Apis.logger.level = Logger::INFO

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
