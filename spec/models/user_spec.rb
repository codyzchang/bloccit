 require 'rails_helper'
 
 describe User do
 
   before do
     @user = user
     @post = post
     @favorite = favorite
   end
   
   include TestFactories
 
   describe "#favorited(post)" do
     it "returns `nil` if the user has not favorited the post" do
       expect( @user.favorited.(@post)).to eq(nil)
     end
 
     it "returns the appropriate favorite if it exists" do
       favorite = @user.favorites
       expect( @user.favorited(@post)).to eq(favorite)
     end
   end
 end