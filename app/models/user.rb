class User < ActiveRecord::Base
	include ActiveModel::SecurePassword
    has_secure_password

    has_many :streams
    has_many :images

    validates_presence_of :email
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i 

end
