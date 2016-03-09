Rails.application.routes.draw do

  resources :registered_apps, except: [:update]

  devise_for :users

  root "welcome#about"

end
