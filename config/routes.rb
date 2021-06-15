Rails.application.routes.draw do
  root 'homepage#index'

  resources :cards
end
