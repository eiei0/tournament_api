# frozen_string_literal: true

module Rosters
  # Responsible for adding players to the
  # team set to the interactor context
  class AddPlayers
    include Interactor

    def call
      team.players << users
    rescue StandardError => e
      context.fail!(
        errors: e.full_message,
        status: :unprocessable_entity
      )
    end

    delegate :team, :users, to: :context, private: true
  end
end
