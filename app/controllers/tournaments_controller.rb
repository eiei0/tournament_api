# frozen_string_literal: true

# Endpoints for Tournament resource
class TournamentsController < ApplicationController
  before_action :set_tournament, only: %i[show update destroy]

  # GET /tournaments
  def index
    @tournaments = Tournament.all

    render json: @tournaments
  end

  # GET /tournaments/1
  def show
    resp = Tournaments::Find.call(params: params)

    if resp.success?
      render json: resp.tournament
    else
      render json: resp.errors, status: resp.status
    end
  end

  # POST /tournaments
  def create
    resp = Tournaments::Create.call(params: params)

    if resp.success?
      render json: resp.tournament, status: :created, location: resp.tournament
    else
      render json: resp.errors, status: resp.status
    end
  end

  # PATCH/PUT /tournaments/1
  def update
    resp = Tournaments::Update.call(params: params)
    if resp.success?
      render json: resp.tournament
    else
      render json: resp.errors, status: resp.status
    end
  end

  # DELETE /tournaments/1
  def destroy
    @tournament.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tournament
    @tournament = Tournament.find(params[:id])
  end
end
