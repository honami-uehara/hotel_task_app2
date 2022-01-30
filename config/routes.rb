Rails.application.routes.draw do
  get 'homes/top'
  get 'homes/index'
  get 'top' => 'homes#top'

  root 'homes#top'
  
  devise_for :users, controllers: { registrations: 'users/registrations' }

  devise_scope :users do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end

  resources :users do
    collection do
      get :profile
    end

    collection do
      get :show2
    end
  end

  resources :rooms do
    collection do
      get :search
    end
  end
  resources :reservations do
    collection do
      get :complete
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
