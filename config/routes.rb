Rails.application.routes.draw do
  root to: "pages#index"

  get 'pages/index'

  resources :posts, shallow: true do
    resources :comments, shallow: true
  end
  resources :goomps do
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
