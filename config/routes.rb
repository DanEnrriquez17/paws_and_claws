Rails.application.routes.draw do
  devise_for :users
  root to: "pets#index"
  resources :pets do
    resources :adoption_requests, except: [:edit, :show, :create]
  end

  post "pets/:pet_id/create_request/", to: "adoption_requests#create", as: "create_request"
  patch "pets/:pet_id/accept_request/:id", to: "adoption_requests#accept", as: "accept_request"


end
