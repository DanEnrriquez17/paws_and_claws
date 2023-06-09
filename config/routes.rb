Rails.application.routes.draw do
  devise_for :users #do
    #resources :adoption_requests, only: [:index]
  #end
  root to: "pets#index"
  resources :pets do
    resources :adoption_requests, except: [:edit, :show]
  end
  get "my_pets_adoption_requests", to: "users#requests", as: "my_pets_requests"
  patch "pets/:pet_id/accept_request/:id", to: "adoption_requests#accept", as: "accept_request"
#get "users/:id/adoption_requests/index", to: "users#adoption_requests_index", as: "users_req_made"

end
