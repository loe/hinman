# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Hinman::Application.initialize!

require 'monkey_patches'
