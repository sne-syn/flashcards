Rails.application.routes.draw do
  root 'homepage#index'

  resources :cards, only: :index
end
