# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_octofacebook_session',
  :secret      => '4613e0011395cd3fef0afb5a4ba009d0511ecac37cb0cb34d57bd4ff4c9fd3827642066c7497a7c3e615e68088a149d7c1a084d6bb6a3e0acefd3a732c704ac7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
