class Stream < ActiveRecord::Base
	belongs_to :user
   	has_many :images

   
   
end
