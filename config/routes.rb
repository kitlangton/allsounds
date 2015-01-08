Rails.application.routes.draw do
  get 'admin/index'

  get 'shows/index'

  get 'shows/new'

  get '/admin', to: 'admin#index'
  mount Upmin::Engine => '/admin'
  root to: 'shows#index'
  devise_for :users
  resources :shows
end
