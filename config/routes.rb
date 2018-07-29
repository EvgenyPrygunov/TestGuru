Rails.application.routes.draw do

  get 'sessions/new'

  get 'users/new'

  root 'tests#index'

  get :register, to: 'users#new'
  get :signin, to: 'sessions#new'
  delete :signout, to: 'sessions#destroy'

  resources :users, only: :create

  resources :sessions, only: :create

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

end
