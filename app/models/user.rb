class User < ActiveRecord::Base
  # To use devise-twitter don't forget to include the :twitter_oauth module:
  # e.g. devise :database_authenticatable, ... , :twitter_oauth

  # IMPORTANT: If you want to support sign in via twitter you MUST remove the
  #            :validatable module, otherwise the user will never be saved
  #            since it's email and password is blank.
  #            :validatable checks only email and password so it's safe to remove

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :oauthable, :twitter_oauth

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :gender, :bio, :name

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    # Get the user email info from Facebook for sign up
    # You'll have to figure this part out from the json you get back
    data = ActiveSupport::JSON.decode(access_token.get('https://graph.facebook.com/me?'))
    puts data.to_json
    if user = User.find_by_email(data["email"])
      user
    else
      # Create an user with a stub password.
      User.create!(
        :name => data["name"], 
        :bio => data["bio"],
        :gender => data["gender"],
        :email => data["email"],
        :password => Devise.friendly_token
      )
    end
  end
  
  
end
