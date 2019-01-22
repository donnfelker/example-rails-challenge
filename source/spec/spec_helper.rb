require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'database_cleaner'
require 'pry'

abort("The Rails environment is running in production mode!") if Rails.env.production?

RSpec.configure do |config|
  DatabaseCleaner.strategy = :truncation

  config.before(:suite) do
    DatabaseCleaner.clean
    Rails.application.load_seed
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.include Rails.application.routes.url_helpers
  config.include Capybara::DSL
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
