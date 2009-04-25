# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tasking_session',
  :secret      => '304a2543719b82abbba3a02de8ad00432626f3fc060463ae844b6ae26c4ae2762765fa03c95e1a8d7fa4dbea688403e3d45d2de6561658abd1c27925c213ebbb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
