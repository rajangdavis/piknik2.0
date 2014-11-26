class Image < ActiveRecord::Base
	belongs_to :stream
	belongs_to :user

has_attached_file :image, styles: {
        :small    => ['900x900^', :jpg] 
    },
    :convert_options { :small => '-gravity center -crop 900x900+0+0 -quality 20%' }
validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  	


    


end
