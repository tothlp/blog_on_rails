Rails.application.routes.draw do
  #Autentikációs rész, devise-hoz
  devise_for :users

  #Ezzel lehet az usereket kezelni adminként. Could go wrong?
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end
  resources :user, :controller => "user"

  get '/user', to: 'users#index', as: 'users'
  patch '/user/:user', to: 'users#update'

  #Itt kezdj. A Controller be van lőve a seedelt kezdőlapra.
  root 'pages#start'

  # Cikkek és hozzá tartozó commentek.
  resources :articles do
    resources :comments
    resources :tags
  end

  # A cikkek listázása, "Admin"-ként
  get 'admin/articles', to: 'articles#list'


  resources :pages



end
