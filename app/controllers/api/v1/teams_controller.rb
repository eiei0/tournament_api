# frozen_string_literal: true

module Api
  module V1
    # Endpoints for Team resource
    class TeamsController < ApplicationController
      # GET /api/v1/teams
      def index
        teams = Team.all

        render json: teams
      end

      # GET /api/v1/teams/1
      def show
        resp = ::Teams::Find.call(params: params)

        if resp.success?
          render json: resp.team
        else
          render json: resp.errors, status: resp.status
        end
      end

      # POST /api/v1/teams
      def create
        resp = ::Teams::Create.call(params: params)

        if resp.success?
          render json: resp.team, status: :created, location: api_v1_teams_url(resp.team)
        else
          render json: resp.errors, status: resp.status
        end
      end

      # PATCH/PUT /api/v1/teams/1
      def update
        resp = ::Teams::Update.call(params: params)

        if resp.success?
          render json: resp.team
        else
          render json: resp.errors, status: resp.status
        end
      end

      # DELETE /api/v1/teams/1
      def destroy
        resp = ::Teams::Destroy.call(params: params)

        if resp.success?
          render json: true, status: :no_content
        else
          render json: resp.errors, status: resp.status
        end
      end
    end
  end
end
