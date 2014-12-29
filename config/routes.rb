Rails.application.routes.draw do
  get 'shows/index'

  get 'shows/new'

  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :shows
end
