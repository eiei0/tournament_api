# frozen_string_literal: true

module Tournaments
  # Responsible for instantiating and validating a new
  # tournament instance
  class Build
    include Interactor

    def call
      context.tournament = build_tournament
    end

    private

    delegate :params, to: :context, private: true

    def build_tournament
      Tournament.new(tournament_params).tap(&method(:validate))
    end

    def tournament_params
      params.require(:tournament).permit(
        :name, :start_date, :end_date, :registration_start_date,
        :registration_end_date, :description, :team_cap
      )
    end

    def validate(tournament)
      return if tournament.valid?

      context.fail!(errors: tournament.errors.full_messages)
    end
  end
end
