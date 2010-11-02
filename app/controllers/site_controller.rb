class SiteController < ApplicationController
  before_filter :get_random_posts
  
  def about
    @post = Post.new
  end

  def connect
    @post = Post.new
  end

  def event
  end
  
  def submit
    @post = Post.new
    # if current_user
    #   @post = current_user.posts.new
    # else
    #   flash[:notice] = "You must login to submit."
    #   redirect_to posts_path
    # end
  end

  def sign_in
    render :layout => false
  end
end

private

def get_random_posts
  @random_posts = Post.random
end