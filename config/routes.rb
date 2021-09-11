Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users


  root to: 'homes#top'
  get '/about' => 'homes#about', as: 'about'


  resources :users,  only: [:show], shallow: true do
    resources :large_categories, only: [:index, :create, :edit, :update, :destroy], shallow:  true do
      resources :small_categories
    end
  end

   resources :todos, only: [:create, :destroy]

   resources :genres, only: [:index, :create, :edit, :update]

end


