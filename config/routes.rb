Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :survivors
      resources :flags, only: [:create]
      resources :trades, only: [:create]
    end
  end
end
