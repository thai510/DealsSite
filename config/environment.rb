# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
LocalAdResource::Application.initialize!
ActiveRecord::Base.pluralize_table_names = false
