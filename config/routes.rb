Rails.application.routes.draw do
  get 'adoption_requests/index'
  get 'adoption_requests/new'
  get 'adoption_requests/create'
  get 'adoption_requests/destroy'
  get 'pets/index'
  get 'pets/create'
  get 'pets/new'
  get 'pets/show'
  get 'pets/edit'
  get 'pets/destroy'
  get 'pets/update'
  devise_for :users
  root to: "pages#home"
  resources :pets do
    resources :adoption_requests, except: [:edit, :show]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
