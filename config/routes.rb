Rails.application.routes.draw do
  resources :insta_posts do
    collection do
      post :import
    end
  end
  

  resources :comments
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "comments#index"
end
