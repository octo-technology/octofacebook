require 'tasty_cucumber'
TastyCucumber.configure { use_token 'a17b87ce1afbeefb566f2d822ef90192e3a65dc3' }

# Sets up the Rails environment for Cucumber
ENV["RAILS_ENV"] ||= "test"
require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')
require 'cucumber/rails/world'
 
require 'database_cleaner'
require 'database_cleaner/cucumber'
DatabaseCleaner.strategy = :truncation
 
# Whether or not to run each scenario within a database transaction.
#
# If you leave this to true, you can turn off traqnsactions on a
# per-scenario basis, simply tagging it with @no-txn
Cucumber::Rails::World.use_transactional_fixtures = true
 
# Whether or not to allow Rails to rescue errors and render them on
# an error page. Default is false, which will cause an error to be
# raised.
#
# If you leave this to false, you can turn on Rails rescuing on a
# per-scenario basis, simply tagging it with @allow-rescue
ActionController::Base.allow_rescue = false
 
# Comment out the next line if you don't want Cucumber Unicode support
require 'cucumber/formatter/unicode'
 
require 'webrat'
require 'cucumber/web/tableish' # Lets you do table.diff!(element_at('#my_table_or_dl_or_ul_or_ol').to_table)
 
Webrat.configure do |config|
  config.mode = :rails
  config.open_error_files = false # Set to true if you want error pages to pop up in the browser
end
 
require 'cucumber/rails/rspec'
require 'webrat/core/matchers'
require 'spec/mocks'
 
Before do
  $rspec_mocks ||= Spec::Mocks::Space.new
end
 
After do
  begin
    $rspec_mocks.verify_all
  ensure
    $rspec_mocks.reset_all
  end
end
