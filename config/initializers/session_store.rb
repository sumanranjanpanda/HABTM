# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_HABTM_session',
  :secret      => '81e9f51d35370ad626eed351b5121de92ea4447ff445fc658d8ae65543cb9e5022fef4758a65f9af382b9899f1145f50ca2d9681c1ce216df5eed8b5a06bd179'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
