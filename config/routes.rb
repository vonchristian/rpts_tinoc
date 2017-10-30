Rails.application.routes.draw do
  resources :real_properties, only: [:index]
  resources :taxpayers, only: [:index, :new, :create, :show] do
    resources :real_properties, only: [:new, :create], module: :taxpayers
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
