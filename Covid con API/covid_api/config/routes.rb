Rails.application.routes.draw do
  resources :test_groups
  resources :drugs
  resources :patients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
