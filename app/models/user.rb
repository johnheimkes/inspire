class User < ActiveRecord::Base
  has_many :posts  
  has_many :authentications
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  def apply_omniauth(omniauth)
    if omniauth['provider'] == "facebook"
      self.email = omniauth['extra']['user_hash']['email'] if email.blank?
      self.name = omniauth['extra']['user_hash']['name'] if name.blank?
      self.username = omniauth['user_info']['nickname'] if username.blank?
      self.bio = omniauth['extra']['user_hash']['bio'] if bio.blank?
      
      authentications.build( :provider => omniauth['provider'], :uid => omniauth['uid'])
    else
      self.email = omniauth['user_info']['email'] if email.blank?
      self.name = omniauth['user_info']['name'] if name.blank?
      self.username = omniauth['user_info']['nickname'] if username.blank?
      self.bio = omniauth['user_info']['description'] if bio.blank?

      authentications.build( :provider => omniauth['provider'], :uid => omniauth['uid'])
    end
  end
  
  def password_required?
    (authentications.empty? || !password.blank?) && super
  end
end
