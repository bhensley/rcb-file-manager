Rails.application.routes.draw do
  get 'admin/index'
  
  devise_for :users

  scope "/admin" do
    resources :teams
    resources :resources
    resources :users
  end

  root to: 'home#index'
end
