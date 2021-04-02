Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :flags, only: [:create]
      resources :trades, only: [:create]

      resources :survivors, only: [:create, :index, :show] do
        collection do
          put '/:id/locations', to: 'survivors#update'
        end
      end

      namespace :reports do
        get 'resources', to: 'resources_average_reports#index'
        get 'survivors', to: 'survivor_reports#index'
        get 'survivors/:id/scores', to: 'score_lost_survivor_infected_reports#show'
      end
    end
  end

  mount Rswag::Api::Engine => 'api-docs'
  mount Rswag::Ui::Engine => 'api-docs'
end
