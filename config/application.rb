require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Fantos
  class Application < Rails::Application
    # config.generators do |g|
      # g.assets false
      # g.helper false
      # g.javascripts true
      # g.stylesheets true
      # g.stylesheet_engine :sass
      # g.template_engine :slim
      # g.view_specs false
      # g.helper_specs false
      # g.routing_specs false
      # g.request_specs false
    # end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
