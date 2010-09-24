# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Inspirempls::Application.initialize!

#kill asset caching in dev mode
if ENV['RAILS_ENV'] == 'development'
  ENV['RAILS_ASSET_ID'] = ''
end