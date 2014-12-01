class User < ActiveRecord::Base
	include ActiveModel::SecurePassword
    has_secure_password

    has_many :streams

    validates_presence_of :username
    

end
