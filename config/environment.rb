# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
HashNotes::Application.initialize!

require 'acts_as_ferret'
