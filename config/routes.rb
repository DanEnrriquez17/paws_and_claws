Rails.application.routes.draw do
  devise_for :users
  root to: "pets#index"
  resources :pets do
    resources :adoption_requests, except: [:edit, :show]
  end

end
