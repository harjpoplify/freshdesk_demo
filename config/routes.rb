Rails.application.routes.draw do
  get "queries/new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "queries#new"
  resource :queries, only: [:new, :create]
end
