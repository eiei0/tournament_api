# frozen_string_literal: true

module Tournaments
  # Responsible for fetching a tournament
  class Find
    include Interactor

    def call
      fail_tournament_not_found! unless (context.tournament = tournament)
    end

    private

    delegate :id, to: :context, private: true

    def tournament
      @tournament ||= Tournament.find_by(id: id)
    end

    def fail_tournament_not_found!
      context.fail!(
        errors: "Tournament #{id} was not found",
        status: :not_found
      )
    end
  end
end
