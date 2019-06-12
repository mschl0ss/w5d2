Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create]
  resources :subs, except: [:destroy]
  resources :posts, except: [:index] do 
    resources :comments, only: [:new]
  end

  # resource :session, only: [:new,:create,:destroy]
  resource :session, only: %i(new create destroy)
  resources :comments, only: [:create, :show]
end
