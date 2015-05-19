RubyExams::Application.routes.draw do
  root to: 'categories#index'

  resources :exams, except: [:destroy]

  resources :categories, except: [:edit, :update, :destroy]
end
