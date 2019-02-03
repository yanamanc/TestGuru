Rails.application.routes.draw do
  
  get :login, to: 'sessions#new'
  root 'tests#index'
  get :signup,to: 'users#new'
  
  get :signup, to: 'users#new'
  
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
