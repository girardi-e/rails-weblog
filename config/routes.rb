Rails.application.routes.draw do
  root 'articles#index'

  resources :articles do
    resources :comments, only: [:index, :new, :create]
  end
  resources :comments, only: [:show, :edit, :update, :delete]
end
