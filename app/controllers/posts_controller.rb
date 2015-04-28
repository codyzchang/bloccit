class PostsController < ApplicationController
 
  def index
    @posts = policy_scope(Post)
    authorize @posts
  end
  
  
end
