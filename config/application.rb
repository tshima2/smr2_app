require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Smr2App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.generators.test_framework      = :rspec
    config.generators.system_tests        = false
    config.generators.stylesheets         = false
    config.generators.javascripts         = false
    config.generators.helper              = false
    config.generators.helper_specs        = false
    config.generators.view_specs          = false
    config.generators.controller_specs    = false

    #config.active_record.default_timezone = :local
    config.time_zone = 'Tokyo'
    end 
end
