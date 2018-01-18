class User < ActiveRecord::Base
  has_secure_password
  # this is let my password encrypted
  # it gets password from user and encrypt it and store it
end
