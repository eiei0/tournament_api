# frozen_string_literal: true

module Tournaments
  # Responsible for saving the tournament instance
  # set the the current interactor context
  class Save
    include Interactor

    def call
      tournament.save!
    rescue StandardError => e
      context.fail!(
        errors: e.full_message,
        status: :unprocessable_entity
      )
    end

    delegate :tournament, to: :context, private: true
  end
end
