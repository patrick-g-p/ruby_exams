RubyExams::Application.routes.draw do
  root to: 'categories#index'

  get '/sign_up', to: 'users#new'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  get '/about', to: 'pages#about'

  resources :users, except: [:index, :destroy]

  resources :exams, except: [:index, :destroy] do
    member do
      post 'vote'
    end

    resources :questions, except: [:index, :show, :destroy] do
      resources :answers, except: [:index, :show, :destroy]
    end
  end

  resources :categories, except: [:edit, :update, :destroy]
end
