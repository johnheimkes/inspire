class Post < ActiveRecord::Base
  # attr_accessible :image_url, :title, :body, :user_id
  cattr_reader :per_page
  @@per_page = 10
  
  has_attached_file :image, :styles => { :medium => "800x600>", :thumb => "50x50!" }
  
end
