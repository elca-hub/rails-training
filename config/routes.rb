Rails.application.routes.draw do
  root 'pages#index'

  resources :subjects
end
