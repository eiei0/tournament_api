# frozen_string_literal: true

module Api
  module V1
    # Endpoints for Team resource
    class TeamsController < ApplicationController
      before_action :set_team, only: %i[show update destroy]

      # GET /api/v1/teams
      def index
        teams = Team.all

        render json: teams
      end

      # GET /api/v1/teams/1
      def show
        resp = Teams::Find.call(params: params)

        if resp.success?
          render json: resp.team
        else
          render json: resp.errors, status: resp.status
        end
      end

      # POST /api/v1/teams
      def create
        resp = Teams::Create.call(params: params)

        if resp.success?
          render json: resp.team, status: :created, location: api_v1_teams_url(resp.team)
        else
          render json: resp.errors, status: resp.status
        end
      end

      # PATCH/PUT /api/v1/teams/1
      def update
        if @team.update(team_params)
          render json: @team
        else
          render json: @team.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/teams/1
      def destroy
        @team.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_team
        @team = Team.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def team_params
        params.require(:team).permit(:name, :player_count)
      end
    end
  end
end
