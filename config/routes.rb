Rails.application.routes.draw do

  get 'welcome/index'

  root to: 'welcome#index'

  devise_for :users

  resources :users do
    resources :registered_applications
  end

  namespace :api, defaults: { format: :json } do
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
  end

end
