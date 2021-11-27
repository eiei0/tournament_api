# frozen_string_literal: true

module Api
  module V1
    # Endpoints for Tournament resource
    class TournamentsController < ApplicationController
      # GET /api/v1/tournaments
      def index
        tournaments = Tournament.all

        render json: tournaments
      end

      # GET /api/v1/tournaments/1
      def show
        resp = Tournaments::Find.call(params: params)

        if resp.success?
          render json: resp.tournament
        else
          render json: resp.errors, status: resp.status
        end
      end

      # POST /api/v1/tournaments
      def create
        resp = Tournaments::Create.call(params: params)

        if resp.success?
          render json: resp.tournament, status: :created, location: api_v1_tournaments_url(resp.tournament)
        else
          render json: resp.errors, status: resp.status
        end
      end

      # PATCH/PUT /api/v1/tournaments/1
      def update
        resp = Tournaments::Update.call(params: params)
        if resp.success?
          render json: resp.tournament
        else
          render json: resp.errors, status: resp.status
        end
      end

      # DELETE /api/v1/tournaments/1
      def destroy
        resp = Tournaments::Destroy.call(params: params)

        if resp.success?
          render json: true, status: :no_content
        else
          render json: resp.errors, status: resp.status
        end
      end
    end
  end
end
