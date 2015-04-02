class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(params.require(:comment).permit(:body))
	  @comment.post = @post
    authorize @comment
    
    if @comment.save
      flash.now[:notice] = "Comment was saved."
      redirect_to [@post, @comment]
    else
      flash.now[:error] = "There was an error saving the comment. Please try again."
      render :new
  end


end

