Rails.application.routes.draw do
  root "dealers#index"

  resource :magic_link_email, only: [:new, :create]

  resources :dealers, param: :slug, only: [:index]
  resources :credits, only: [:index]
end
