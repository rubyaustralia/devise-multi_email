ENV['RAILS_ENV'] = 'test'

require 'spec_helper'
require 'capybara/rspec'
require 'rails_app/config/environment'
require 'orm/active_record'

# Reload routes to ensure Devise mappings are available in test environment
Rails.application.reload_routes!

# I haven't worked out why this is needed. Without it, the user routes don't exist, but it requires
# both the `reload_routes!` above plus this one after initialize
Rails.application.config.after_initialize do
  Rails.application.reload_routes!
end

Capybara.app = RailsApp::Application

RSpec.configure do |config|
  config.include Rails.application.routes.url_helpers
end

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
