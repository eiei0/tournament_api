# frozen_string_literal: true

module Tournaments
  # Responsible for saving the tournament instance
  # set the the current interactor context
  class AssignAttributes
    include Interactor

    def call
      return if assign_attributes_and_valiate

      context.fail!(
        errors: tournament.errors.full_messages,
        status: :unprocessable_entity
      )
    end

    private

    delegate :tournament, :params, to: :context, private: true

    def assign_attributes_and_valiate
      assign_attributes
      tournament.valid?
    end

    def assign_attributes
      tournament.assign_attributes(tournament_params)
    end

    def tournament_params
      params.require(:tournament).permit(
        :name, :start_date, :end_date, :registration_start_date,
        :registration_end_date, :description, :team_cap
      )
    end
  end
end
