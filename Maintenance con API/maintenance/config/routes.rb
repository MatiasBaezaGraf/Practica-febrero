Rails.application.routes.draw do
  resources :invoice_items
  resources :invoices
  resources :brands
  resources :replacements
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
