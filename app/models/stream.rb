class Stream < ActiveRecord::Base
	belongs_to :user
   	has_many :images

   validates_presence_of :name
   
end
