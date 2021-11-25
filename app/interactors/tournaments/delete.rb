# frozen_string_literal: true

module Tournaments
  # Responsible for deleting the tournament instance
  # set the the current interactor context
  class Delete
    include Interactor

    def call
      tournament.destroy!
    rescue StandardError => e
      context.fail!(
        errors: e.full_message,
        status: :conflict
      )
    end

    delegate :tournament, to: :context, private: true
  end
end
