# frozen_string_literal: true

module Teams
  # Responsible for instantiating and validating a new
  # team instance
  class Build
    include Interactor

    def call
      context.team = build_team
    end

    private

    delegate :params, to: :context, private: true

    def build_team
      Team.new(team_params).tap(&method(:validate))
    end

    def team_params
      params.require(:team).permit(:name)
    end

    def validate(team)
      return if team.valid?

      context.fail!(
        errors: team.errors.full_messages,
        status: :unprocessable_entity
      )
    end
  end
end
