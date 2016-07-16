Rails.application.routes.draw do
  root 'welcome#index'

  get 'about' => 'welcome#about'

  namespace :api, defaults: { format: :json } do
    resources :users do
      resources :lists
    end

    resources :lists, only: [] do
      resources :items, only: [:create, :index]
    end

    resources :items, only: [:destroy, :update]
  end
end
