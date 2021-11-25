# frozen_string_literal: true

module Tournaments
  # Responsible for saving the tournament instance
  # set the the current interactor context
  class Save
    include Interactor

    def call
      return if tournament.save

      context.fail!(
        errors: tournament.errors.full_messages,
        status: :unprocessable_entity
      )
    end

    delegate :tournament, to: :context, private: true
  end
end
