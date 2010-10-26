class UserController < ApplicationController
  
  def index
    @posts = Post.paginate :page => params[:page], :order => 'created_at DESC'
  end
  
  def show
    @posts = Post.paginate :
  end

end
