Rails.application.routes.draw do
  get 'about' => 'welcome#about'

  get 'index' => 'welcome#index'

  root "welcome#index"

  devise_for :users

end
