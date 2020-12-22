Rails.application.routes.draw do
  resources :bloggers
  resources :posts, only: [:index, :show, :new, :create]
  resources :destinations, only: [:index, :show]
  get "bloggers/sorted", to: "bloggers#sorted", as: 'sorted'
end
