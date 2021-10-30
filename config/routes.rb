Rails.application.routes.draw do
  resources :uploads, only: :create
end
