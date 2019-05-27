Rails.application.routes.draw do
  
  root 'tests#index'

  devise_for :users, path: :gurus
  
  resources :tests, only: :index do
    post :start, on: :member
  end

  namespace :admin do
    resources :tests  do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
    get 'gists/index'
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  get 'pages/statistic'
  resources :feedbacks, only: %i[new create]
end
