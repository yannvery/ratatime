require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ratatime
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.generators do |g|
      g.test_framework  false
      g.view_specs      false
      g.helper_specs    false
    end
    config.active_record.time_zone_aware_types = [:time]
    config.autoload_paths += %W(#{config.root}/app/services)
  end
end
