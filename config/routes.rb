Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home', to: 'welcome#home'

  root to: 'welcome#home'

  resources :articles
end
