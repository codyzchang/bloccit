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

  def destroy
     @topic = Topic.find(params[:topic_id])
     @post = @topic.posts.find(params[:post_id])
     @comment = @post.comments.find(params[:id])
 
     authorize @comment
     if @comment.destroy
       flash.now[:notice] = "Comment was removed."
       redirect_to [@topic, @post]
     else
       flash.now[:error] = "Comment couldn't be deleted. Try again."
       redirect_to [@topic, @post]
     end
   end

end

