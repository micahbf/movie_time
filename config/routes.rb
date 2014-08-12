Rails.application.routes.draw do
  resources :titles, only: [:index, :show]
  resources :persons, only: [:index, :show]
  root 'static_pages#home'
end
