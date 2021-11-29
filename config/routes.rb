# frozen_string_literal: true

Rails.application.routes.draw do
  use_doorkeeper

  namespace :api do
    namespace :v1 do
      resources :teams do
        scope module: :teams do
          resources :rosters, only: :create
        end
      end

      resources :tournaments
    end
  end
end
