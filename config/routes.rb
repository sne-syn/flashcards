Rails.application.routes.draw do
  root 'homepage#index'

  resources :cards, only: [:index, :new, :create, :edit, :update, :destroy]
end
