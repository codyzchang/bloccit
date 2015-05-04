class FavoritesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)

    authorize favorite
    
    if favorite.save
      flash.now[:notice] = "Favorited post"
      redirect_to [@post.topic, @post]
    else
      flash.now[:error] = "Unable to add favorite. Please try again."
      redirect_to [@post.topic, @post]
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])

    authorize favorite

    if favorite.destroy
      flash.now[:success] = "Removed favorite."
      redirect_to [@post.topic, @post]
    else
      flash.now[:error] = "Unable to remove favorite. Please try again."
      redirect_to [@post.topic, @post]
    end
  end

end