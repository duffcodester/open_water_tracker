require File.expand_path('../boot', __FILE__)
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'sprockets/railtie'
require 'csv'
require 'rails/all'

Bundler.require(:default, Rails.env)

module Comsa
  class Application < Rails::Application
    config.generators do |g|
      g.stylesheets false
      g.test_framework false
    end

    config.time_zone = 'Mountain Time (US & Canada)'

    config.assets.initialize_on_precompile = false
    config.i18n.enforce_available_locales = true

    config.to_prepare do
      Devise::SessionsController.layout 'application'
    end

    config.assets.precompile += %w( *.js *.scss )

    config.serve_static_assets = true
  end
end
