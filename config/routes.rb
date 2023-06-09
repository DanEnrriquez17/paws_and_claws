Rails.application.routes.draw do
  devise_for :users #do
    #resources :adoption_requests, only: [:index]
  #end
  root to: "pets#index"
  resources :pets do
    resources :adoption_requests, except: [:edit, :show]
  end

  get "my_requests", to: "users#myrequests", as: "my_requests"
  post "pets/:pet_id/create_request/", to: "adoption_requests#create", as: "create_request"
  patch "pets/:pet_id/accept_request/:id", to: "adoption_requests#accept", as: "accept_request"
#get "users/:id/adoption_requests/index", to: "users#adoption_requests_index", as: "users_req_made"

end
