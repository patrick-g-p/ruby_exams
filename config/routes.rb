RubyExams::Application.routes.draw do
  root to: 'categories#index'

  get '/sign_up', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/faq', to: 'pages#faq'

  resources :users, except: [:index, :destroy]

  resources :exams, except: [:index, :destroy] do
    member do
      post 'vote'
    end

    resources :comments, only: [:create] do
      member do
        post 'vote'
      end
    end

    resources :questions, except: [:index, :show, :destroy] do
      resources :answers, except: [:index, :show, :destroy]
    end
  end

  resources :categories, except: [:edit, :update, :destroy]
end
