class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable, :timeoutable and :oauthable
  devise :database_authenticatable, :oauthable

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
