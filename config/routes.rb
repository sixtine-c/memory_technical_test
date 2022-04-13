Rails.application.routes.draw do
  root to: 'orders#dashboard'
  resources :orders do
    collection do
      get 'dashboard'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
