Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
  end

  resources :registered_apps, except: [:update]

  devise_for :users

  root "welcome#about"

end
