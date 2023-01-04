Rails.application.routes.draw do
  root "dealers#index"

  resource :magic_link_email, only: [:new, :create, :destroy]
  match "magic_link_emails/authenticate", to: "magic_link_emails#authenticate", via: [:get, :post]

  resources :dealers, param: :slug, only: [:index]
  resources :credits
  resources :users, only: [:show]
end
