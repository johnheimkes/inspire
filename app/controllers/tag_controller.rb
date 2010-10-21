class TagController < ApplicationController
  
  def show
    @posts = Post.tagged_with(params[:tag])
  end

end
