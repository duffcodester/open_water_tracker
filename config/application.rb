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
    system("rubocop -D #{Rails.root}") if Rails.env.development?

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

    config.middleware.use HtmlCompressor::Rack,
      compress_css: true,
      compress_javascript: false,
      css_compressor: Sass,
      enabled: true,
      preserve_line_breaks: false,
      remove_comments: true,
      remove_form_attributes: false,
      remove_http_protocol: false,
      remove_https_protocol: false,
      remove_input_attributes: true,
      remove_intertag_spaces: false,
      remove_javascript_protocol: true,
      remove_link_attributes: true,
      remove_multi_spaces: true,
      remove_quotes: true,
      remove_script_attributes: true,
      remove_style_attributes: true,
      simple_boolean_attributes: true,
      simple_doctype: false

    config.assets.precompile += %w( *.js *.scss )

    config.serve_static_assets = true
  end
end
