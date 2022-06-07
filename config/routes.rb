Rails.application.routes.draw do
 
  root to: 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: :index do
    resources :questions, shallow: true, only: :index do
      resources :answers, shallow: true, only: :show
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[ show update ] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests do
      resources :questions do
        resources :answers
      end
    end
  end

end
