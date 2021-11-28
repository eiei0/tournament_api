# frozen_string_literal: true

module Teams
  # Responsible for saving the team instance
  # set the the current interactor context
  class AssignAttributes
    include Interactor

    def call
      return if assign_attributes_and_valiate

      context.fail!(
        errors: team.errors.full_messages,
        status: :unprocessable_entity
      )
    end

    private

    delegate :team, :params, to: :context, private: true

    def assign_attributes_and_valiate
      assign_attributes
      team.valid?
    end

    def assign_attributes
      team.assign_attributes(team_params)
    end

    def team_params
      params.require(:team).permit(:name)
    end
  end
end
