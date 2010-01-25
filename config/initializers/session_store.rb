# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_hinman_session',
  :secret      => 'b34600a592dd2a298d554aedbe5f50fb93e40a3fe261891cb4d21e14b4415d3ded18d8058b54adfdfd0399734db0be9c7383340c33138d5b684cdd5d130e4679'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
