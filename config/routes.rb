Rails.application.routes.draw do
  get 'dashboards/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'dashboards#index'

  resources :employees
  resources :employee_types, except: :index
  resources :bank_account_types, except: :index
  resources :settings, only: :index
end
