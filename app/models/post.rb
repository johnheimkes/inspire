class Post < ActiveRecord::Base
  attr_accessible :image_url, :title, :body, :user_id
end
