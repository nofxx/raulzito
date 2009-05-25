# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_chexx_session',
  :secret      => '6b94a69ebbb5351ecf01484ba392fef4df60ac1175de40f08c992c68122a892983ebc3f1701c759b6fa1f364a2a72694fb63d60dc6ccaa3170c4fd4eb5f1b6ab'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
