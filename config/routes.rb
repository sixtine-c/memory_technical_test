Rails.application.routes.draw do
  root to: 'pages#home'
  resources :orders do
    collection do
      get 'dashboard'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
