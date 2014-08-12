Rails.application.routes.draw do
  resources :titles, only: [:index, :show]
  resources :persons, only: [:index, :show]
end
