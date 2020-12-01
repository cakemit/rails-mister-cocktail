Rails.application.routes.draw do
  get 'pages/home'
  root to: 'pages#home'
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: [:destroy]
end
