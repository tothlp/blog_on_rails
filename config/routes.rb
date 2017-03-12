Rails.application.routes.draw do
  devise_for :users

  root 'pages#start'

  resources :articles do
    resources :comments
  end
  get 'admin/articles', to: 'articles#list'

  resources :pages



end
