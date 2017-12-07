Rails.application.routes.draw do
  resources :real_properties, only: [:index, :show] do
    resources :north_property_boundaries, only: [:new, :create], module: :real_properties
    resources :south_property_boundaries, only: [:new, :create], module: :real_properties
    resources :appraisals, only: [:new, :create], module: :real_properties
    resources :additional_taxpayers, only: [:new, :create], module: :real_properties
    resources :subdivisions, only: [:new, :create], module: :real_properties
    resources :revisions, only: [:new, :create], module: :real_properties
    resources :assessed_real_properties, only: [:new, :create], module: :real_properties
    resources :transfer_transactions, only: [:new, :create], module: :real_properties
    resources :north_property_boundaries
    resources :encumberances, only: [:new, :create], module: :real_properties
    resources :buildings, only: [:new, :create], module: :real_properties
  end
  namespace :properties do
    resources :buildings, only: [:index]
  end
  resources :taxpayers, only: [:index, :new, :create, :show] do
    resources :real_properties, only: [:new, :create], module: :taxpayers
    resources :consolidated_real_properties, only: [:new, :create], module: :taxpayers
  end
  resources :consolidations, only: [:show] do
    resources :real_property_consolidations, only: [:new, :create]
  end
  resources :settings, only: [:index]
  namespace :settings do
    resources :classifications, only: [:show, :new, :create] do
      resources :sub_classifications, only: [:new, :create]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
