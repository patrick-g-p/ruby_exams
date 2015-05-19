RubyExams::Application.routes.draw do
  root to: 'categories#index'

  resources :categories, except: [:edit, :update, :destroy]
end
