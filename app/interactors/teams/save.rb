# frozen_string_literal: true

module Teams
  # Responsible for saving the team instance
  # set the the current interactor context
  class Save
    include Interactor

    def call
      team.save!
    rescue StandardError => e
      context.fail!(
        errors: e.full_message,
        status: :unprocessable_entity
      )
    end

    delegate :team, to: :context, private: true
  end
end
