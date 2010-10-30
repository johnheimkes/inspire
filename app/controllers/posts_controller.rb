class PostsController < ApplicationController
  
  before_filter :get_tags_count, :get_random_posts
  def index
    @posts = Post.paginate(:page => params[:page], :order => 'created_at DESC')
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    if current_user
      @post = current_user.posts.new
    else
      redirect_to posts_path
    end
  end
  
  def create
    @post = current_user.posts.new(params[:post])
    if @post.save
      flash[:notice] = "Successfully created post."
      redirect_to @post
    else
      render :action => 'new'
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = "Successfully updated post."
      redirect_to @post
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Successfully destroyed post."
    redirect_to posts_url
  end
end

private

def get_tags_count
  @tags = Post.tag_counts_on(:tags)
end

def get_random_posts
  @random_posts = Post.random
end
