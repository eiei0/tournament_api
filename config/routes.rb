# frozen_string_literal: true

Rails.application.routes.draw do
  use_doorkeeper

  namespace :api do
    namespace :v1 do
      resources :teams
      resources :tournaments
    end
  end
end
