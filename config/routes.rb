Rails.application.routes.draw do
  
  root 'tests#index'
  get :login, to: 'sessions#new'
  get :signup,to: 'users#new'
  get :logout, to: 'sessions#delete'
  
  resources :users, only: :create
  resources :sessions, only: :create
  
  resources :tests do
    resources :questions, shallow: true, exept: :index do
      resources :answers, shallow: true, exept: :index
    end

    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end
end
