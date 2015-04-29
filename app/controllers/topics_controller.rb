class TopicsController < ApplicationController

  def index
     @topics = Topic.visible_to(current_user).paginate(page: params[:page], per_page: 10)
     authorize @topics
  end

  def new
     @topic = Topic.new
     authorize @topic
  end

  def show
     @topic = Topic.find(params[:id])
     authorize @topic
     @posts = @topic.posts.includes(:user).includes(:comments).paginate(page: params[:page], per_page: 10)
  end

  def edit
     @topic = Topic.find(params[:id])
     authorize @topic
  end
 
  def create
     @topic = Topic.new(topic_params)
     authorize @topic
     if @topic.save
       redirect_to @topic, notice: "Topic was saved successfully."
     else
       flash.now[:error] = "Error creating topic. Please try again."
       render :new
     end
   end
 
  def update
     @topic = Topic.find(params[:id])
     authorize @topic
     if @topic.update_attributes(topic_params)
       redirect_to @topic
     else
       flash.now[:error] = "Error saving topic. Please try again."
       render :edit
     end
  end
  
  def topic_params
    params.require(:topic).permit(:name, :description, :public)
  end
  
  def destroy
    @topic= Topic.find(params[:id])
    name = @topic.name
    authorize @topic
    
    if @topic.destroy
      flash.now[:notice] = "Topic Destroyed"
      redirect_to topics_path
    else
      flash.now[:error] = "Topic Destruction Error"
      render :show
    end
  end
end
