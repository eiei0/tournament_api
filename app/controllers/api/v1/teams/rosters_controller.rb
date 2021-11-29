# frozen_string_literal: true

module Api
  module V1
    module Teams
      # Responsible the endpoints that manage a team rosters
      class RostersController < ApplicationController
        # POST /api/v1/teams/:team_id/rosters
        def create
          resp = Rosters::Build.call(params: params)

          if resp.success?
            render json: true, status: :no_content
          else
            render json: resp.errors, status: resp.status
          end
        end
      end
    end
  end
end
