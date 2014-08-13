Rails.application.routes.draw do
  resources :titles, only: [:index, :show] do
    get 'send_to_a_friend', on: :member
  end
  root 'static_pages#home'
end
