Rails.application.routes.draw do
  root 'welcome#index'

  get 'about' => 'welcome#about'

  namespace :api, defaults: { format: :json } do
    resources :users
  end
end
