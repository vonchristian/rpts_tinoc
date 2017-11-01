Rails.application.routes.draw do
  resources :real_properties, only: [:index, :show] do
    resources :revisions, only: [:new, :create], module: :real_properties
    resources :tax_declarations, only: [:new, :create], module: :real_properties

  end
  resources :taxpayers, only: [:index, :new, :create, :show] do
    resources :real_properties, only: [:new, :create], module: :taxpayers
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
