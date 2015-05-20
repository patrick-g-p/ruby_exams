RubyExams::Application.routes.draw do
  root to: 'categories#index'

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
