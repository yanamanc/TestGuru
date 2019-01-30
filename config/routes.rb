Rails.application.routes.draw do
  
  get 'users/new'

  root 'tests#index'

  resources :users, only: :create

  get :signup, to: 'users#new'
  
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
