#settings for activrecord

require 'active_record'
require 'pg'
require_relative 'models/user'
require_relative 'models/city'
require_relative 'models/house'
require_relative 'models/comment'

options = {
  adapter: 'postgresql',
  database: 'ausab'
}
# ActiveRecord::Base.establish_connection(options) #changed when deploying
# cause Heroku can't talk to my database
ActiveRecord::Base.establish_connection( ENV['DATABASE_URL'] || options)
