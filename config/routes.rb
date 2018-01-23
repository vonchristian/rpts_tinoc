Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  resources :real_properties, only: [:index, :show] do
    resources :transactions, only: [:index], module: :real_properties
    resources :arps, only: [:index], module: :real_properties
    resources :encumberances, only: [:index], module: :real_properties
    resources :field_appraisal_and_assessments, only: [:index], module: :real_properties
    resources :reports, only: [:index], module: :real_properties
    resources :assessed_values, only: [:new, :create], module: :real_properties
    resources :revisions, only: [:index], module: :real_properties
    resources :market_value_adjustments, only: [:new, :create], module: :real_properties
    resources :real_property_areas, only: [:new, :create], module: :real_properties
    resources :classifications, only: [:new, :create], module: :real_properties
    resources :settings, only: [:index], module: :real_properties
    resources :north_property_boundaries, only: [:new, :create], module: :real_properties
    resources :south_property_boundaries, only: [:new, :create], module: :real_properties
    resources :additional_taxpayers, only: [:new, :create], module: :real_properties
    resources :subdivision_transactions, only: [:new, :create], module: :real_properties
    resources :assessed_real_properties, only: [:new, :create], module: :real_properties
    resources :transfer_transactions, only: [:index, :new, :create], module: :real_properties
    resources :north_property_boundaries
  resources :encumberances, only: [:new, :create], module: :real_properties
    resources :buildings, only: [:new, :create], module: :real_properties
  end

  namespace :properties do
    resources :buildings, only: [:index]
    resources :lands, only: [:index]
    resources :machineries, only: [:index]
  end

  resources :taxpayers, only: [:index, :new, :create, :show] do
    resources :real_properties, only: [:new, :create], module: :taxpayers
    resources :real_property_consolidations, only: [:new, :create], module: :taxpayers
    resources :consolidation_transactions, only: [:new, :create], module: :taxpayers
  end
  resources :settings, only: [:index]
  namespace :settings do
    resources :adjustment_factors, only: [:new, :create]
    resources :classifications, only: [:show, :new, :create] do
      resources :sub_classifications, only: [:new, :create]
      resources :assessment_levels, only: [:new, :create], module: :classifications
    end
    resources :sub_classifications, only: [:show] do
      resources :market_value_schedules, only: [:new, :create]
    end
  end
  resources :encumberances, only: [:show] do
    resources :cancellations, only: [:create], module: :encumberances
  end
  resources :arps, only: [:show] do
    resources :cancellations, only: [:create], module: :arps
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
