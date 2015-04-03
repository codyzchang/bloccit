class PostsController < ApplicationController
 
  def index
    @posts = policy_scope(Post)
    authorize @posts
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    @comment = Comment.find(params[:id])
    authorize @post
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    authorize @post
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.build(post_params)
    @post.topic = @topic
    authorize @post

    if @post.save
      flash.now[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash.now[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.build(post_params)
    authorize @post

    if @post.update_attributes(post_params)
      flash.now[:notice] = "Post was updated."
      redirect_to [@topic, @post]
    else
      flash.now[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end
  
 private

  def post_params
    params.require(:post).permit(:title, :body)
  end
  
  def destroy
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:id])
     title = @post.title
     authorize @post
 
     if @post.destroy
       flash.now[:notice] = "\"#{title}\" was deleted successfully."
       redirect_to @topic
     else
       flash.now[:error] = "There was an error deleting the post."
       render :show
     end
   end
  
  
  
end
