Rails.application.routes.draw do
  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }


  root to: 'homes#top'
  get '/about' => 'homes#about', as: 'about'


  resources :users, only: [:show, :edit, :update], shallow: true do
    resources :large_categories, only: [:index, :create, :edit, :update, :destroy], shallow: true do
      collection do
        get :search
      end
      resources :small_categories, only: [:index, :new, :show, :create, :destroy] do
        resource :stars, only: [:create, :destroy]
      end
    end
  end


  resources :todos, only: [:new, :create, :destroy]


  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
