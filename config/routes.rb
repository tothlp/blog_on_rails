Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#start'

  resources :articles do
    resources :comments
  end
  get 'admin/articles', to: 'articles#list'

  resources :pages



end
