class UserController < ApplicationController
  before_filter :get_tags_count, :get_random_posts
  
  def index
    @posts = Post.paginate :page => params[:page], :order => 'created_at DESC'
    @user = User.find_by_username(params[:id])
  end
  
  def show
    @user = User.find_by_username(params[:id])
    @posts = Post.paginate :page => params[:page], :order => 'created_at DESC'
    @tags = get_user_tags_count(@user)
  end

  private

  def get_user_tags_count(user)
    return user.posts.tag_counts_on(:tags)
  end

  def get_random_posts
    @random_posts = Post.random
  end

end
