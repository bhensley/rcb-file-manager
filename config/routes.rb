Rails.application.routes.draw do
  get 'admin/index'
  post '/upload/:title', to: 'uploads#index', as: 'upload', constraints: { title: %r{[^\/]+} }

  devise_for :users

  scope "/admin" do
    resources :teams
    resources :resources
    resources :users
  end

  root to: 'home#index'
end
