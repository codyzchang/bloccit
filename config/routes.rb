Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:update]
  resources :topics do
    resources :posts, except: [:index] do
      resources :comments, only: [:create, :destroy]
    end
   end
  
  resources :advertisements

  get 'about' => 'welcome#about'
  get 'welcome/contact'

  root to: 'welcome#index'
  
end
