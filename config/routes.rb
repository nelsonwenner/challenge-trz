Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :survivors
      resources :flags, only: [:create]
      resources :trades, only: [:create]

      namespace :reports do
        get 'resources', to: 'resources_average_reports#index'
      end
    end
  end
end
