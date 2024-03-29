require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

require 'database_cleaner'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
DatabaseCleaner.strategy = :truncation
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  DatabaseCleaner.strategy = :truncation

  RSpec.configure do |c|
    c.before(:each) do
      DatabaseCleaner.clean
    end

    c.after(:each) do
      DatabaseCleaner.clean
    end
    c.include Capybara::DSL
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
