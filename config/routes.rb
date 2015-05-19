RubyExams::Application.routes.draw do
  root to: 'categories#index'

  resources :exams, except: [:index, :destroy]

  resources :categories, except: [:edit, :update, :destroy]
end
