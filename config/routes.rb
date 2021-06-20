Rails.application.routes.draw do
  root 'homepage#index'

  resources :cards, except: [:show]
end
