class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if current_user
  end
  
  def create
    # render :text => request.env["omniauth.auth"].to_yaml
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if authentication
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect(:user, posts_url)
    elsif current_user
      current_user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
      flash[:notice] = "Authentication successful."
      redirect_to posts_url
    else
      user = User.new
      user.apply_omniauth(omniauth)
      if user.save
        flash[:notice] = "Signed in successfully."
        sign_in_and_redirect(:user, posts_url)
      else
        session[:omniauth] = omniauth.except('extra')
        redirect_to new_user_registration_url
      end
    end
  end
  
  def destroy
    @authentication = current_user.authentications.last
    puts @authentication
    @authentication.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to authentications_url
  end
end
