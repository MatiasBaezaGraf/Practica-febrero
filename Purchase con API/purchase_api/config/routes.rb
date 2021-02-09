Rails.application.routes.draw do
  resources :item_carts
  resources :carts
  resources :brands
  resources :components
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
