class UserController < ApplicationController
  
  def index
    @posts = Post.paginate :page => params[:page], :order => 'created_at DESC', :where => ['user_id' = ]
  end

end
