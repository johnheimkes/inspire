class Post < ActiveRecord::Base
  require 'open-uri'
  before_validation :download_remote_image, :if => :image_url_provided?
  validates_presence_of :image_remote_url, :if => :image_url_provided?, :message => 'is invalid or inaccessible'
  
  belongs_to :user
  acts_as_taggable
    
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

  def self.random
    return self.all(:limit => 5, :order => "id random()")
  end
  
  private
  
    def image_url_provided?
      !self.image_url.blank?
    end

    def download_remote_image
      self.image = do_download_remote_image
      self.image_remote_url = image_url
    end

    def do_download_remote_image
      io = open(URI.parse(image_url))
      def io.original_filename; base_uri.path.split('/').last; end
      io.original_filename.blank? ? nil : io
    rescue # catch url errors with validations instead of exceptions (Errno::ENOENT, OpenURI::HTTPError, etc...)
    end
  
end
