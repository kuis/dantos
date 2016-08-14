Rails.application.routes.draw do
  root to: "pages#index"

  get 'pages/index'

  resources :goomps do
    resources :comments, shallow: true
    resources :posts, shallow: true
    resources :subtopics, shallow: true
  end

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: 'users/registrations'
  }
  resources :users, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
