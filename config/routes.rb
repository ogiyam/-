Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }


  root to: 'homes#top'
  get '/about' => 'homes#about', as: 'about'


  resources :users, only: [:show, :edit, :update], shallow: true do
    resources :large_categories, only: [:index, :create, :edit, :update, :destroy], shallow: true do
      resources :small_categories do
        resource :stars, only: [:create, :destroy]
      end
    end
  end


 resources :large_categories do
    collection do
      get :search
    end
  end


   resources :todos, only: [:new, :create, :destroy]

   resources :genres, only: [:index, :create, :edit, :update]

end