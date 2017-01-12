Rails.application.routes.draw do
  devise_for :admins, controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home', to: 'welcome#home'

  #root to: 'welcome#home'
  root to: 'articles#index'

  authenticate :admin do
    resources :articles, only: [ :new, :create, :edit, :update, :destroy ] do
      resources :images
    end
  end
  resources :articles
end
