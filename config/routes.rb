Rails.application.routes.draw do
  resources :scrapes, only: [:create]
  resources :likes
  resources :memberships
  root to: "pages#index"

  get 'pages/index'

  resources :posts, shallow: true do
    post :like, on: :member
    resources :comments, only: [:create, :destroy, :update, :edit], shallow: true do
      post :like, on: :member
    end
  end
  resources :goomps do
    post :join, on: :member
    resources :posts, shallow: true
    resources :subtopics, shallow: true
  end

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: 'users/registrations'
  }
  resources :users, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
