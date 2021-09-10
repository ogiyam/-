Rails.application.routes.draw do


  devise_for :users


  root to: 'homes#top'
  get '/about' => 'homes#about', as: 'about'


  resources :users,  only: [:show], shallow: true do
    resources :large_categories, only: [:index, :create, :edit, :destroy], shallow:  true do
      resources :small_categories, only: [:index, :new, :create, :edit, :destroy]
    end
  end

   resources :todos, only: [:index, :create, :edit, :update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
