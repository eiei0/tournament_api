# frozen_string_literal: true

module Users
  # Responsible for saving the tournament instance
  # set the the current interactor context
  class List
    include Interactor

    def call
      context.users = User.where(id: user_params)
    rescue StandardError => e
      context.fail!(
        errors: e.full_message,
        status: :unprocessable_entity
      )
    end

    private

    delegate :params, to: :context, private: true

    def user_params
      params.require(:user_ids)
    end
  end
end
