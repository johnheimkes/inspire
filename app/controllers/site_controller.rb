class SiteController < ApplicationController
  before_filter :get_random_posts
  
  def about
    @post = Post.new
  end

  def connect
    @post = Post.new
  end
  
  def submit
    @post = Post.new
  end

  def sign_in
    render :layout => false
  end
end

private

def get_random_posts
  @random = Post.all
end
