class Post < ActiveRecord::Base
  belongs_to :user

    
  # attr_accessible :image_url, :title, :body, :user_id
  
  cattr_reader :per_page
  @@per_page = 10
  
  has_attached_file :image, 
                    :styles => { :medium => "800x600>", :thumb => "50x50" },
                    :storage => :s3, 
                    :s3_credentials => { :access_key_id => ENV['S3_KEY'],
                                         :secret_access_key => ENV['S3_SECRET'],
                                         :bucket => "images.inspirempls.com" },
                    :path => "/:style/:filename"
                    
  
end
