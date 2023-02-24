Rails.application.routes.draw do
  devise_for :articles 

    devise_scope :article do
      
        get "articles/select_article_type" => "devise/registrations#select_article_type"
        get "articles/create_creative_article", :to => "devise/registrations#create_creative_article", :as => "create_creative_user"

      get 'password', to:'devise/passwords#edit' ,as: :edit_password
      patch 'password', to:'devise/passwords#update'
      get 'sign_up',to:'devise/registrations#new'
      post 'sign_up',to:'devise/registrations#create'
      get 'sign_in',to:'devise/sessions#new'
      post 'sign_in',to:'devise/sessions#create'
      get 'password/reset' ,to:'devise/password_resets#new'
      post 'password/reset' ,to:'devise/password_resets#create'
      get 'password/reset/edit' ,to:'devise/password_resets#edit'
      patch 'password/reset/edit' ,to:'devise/password_resets#update'
      delete 'log_out', to: 'devise/sessions#destroy'
      get 'article',to: 'articles#new'
      post 'article',to: 'articles#create'
      resources :articles
    end



  resources :students
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :books
  resources :articles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"
  namespace :api do 
    namespace :v1 do
      resources :articles
      resources :books
      resources :students
    end
  end  
end
