# frozen_string_literal: true

module Teams
  # Responsible for deleting the team instance
  # set the the current interactor context
  class Delete
    include Interactor

    def call
      team.destroy!
    rescue StandardError => e
      context.fail!(
        errors: e.full_message,
        status: :conflict
      )
    end

    delegate :team, to: :context, private: true
  end
end
