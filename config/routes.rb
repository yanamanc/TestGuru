Rails.application.routes.draw do
  
  root 'tests#index'
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }
  
  resources :tests, only: :index do
    resources :questions, shallow: true, exept: :index do
      resources :answers, only: :index, shallow: true, exept: :index
    end

    post :start, on: :member
  end

  namespace :admin do
    resources :tests  do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end
end
