class TagController < ApplicationController
  
  def show
    @posts = Post.tagged_with("foo")
  end

end
