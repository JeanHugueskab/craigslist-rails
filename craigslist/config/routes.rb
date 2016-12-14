Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'categories#index'

  resources :categories, only: [:index, :show] do
    resources :articles, except: [:index]
  end

  get '/login'    => 'sessions#new'
  post '/login'   => 'sessions#create'
  get '/logout'   => 'sessions#destroy'

  get '/register' => 'users#new'
  post '/users'   => 'users#create'

end
