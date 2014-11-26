class User < ActiveRecord::Base
	include ActiveModel::SecurePassword
    has_secure_password

    has_many :streams
    has_many :images

    validates_presence_of :username
    

end
