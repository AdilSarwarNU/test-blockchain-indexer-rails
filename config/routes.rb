Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      post '/auth/login', to: 'authentication#login'
      resources :users
      resources :comments, only: [:create]
      resources :transactions do
        member do
          get :comments
        end
      end
    end
  end
end
