class FavoritesController < ApplicationController
   
  
  def create
     post = Post.find(params[:post_id])
     favorite = current_user.favorites.build(post: post)
     
    authorize @favorite
     if favorite.save
       flash.now[:notice] = "Favorite was saved"
       redirect_to [post.topic, post]
     else
       flash.now[:error] = "There was an error Favoriting."
       redirect_to [post]
     end
   end
   
  def destroy
     post = Post.find(params[:post_id])
     authorize @favorite
    @favorite = @post.favorite.find(params[:id])
    
     if favorite.destroy
       flash.now[:notice] = "Favorite was destroyed"
       redirect_to [@post]
     else
       flash.now[:error] = "Erro destroying the Favorite."
       redirect_to [@post]
     end
   end
  
  
  
  
  
  
  
end
