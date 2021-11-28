# frozen_string_literal: true

module Teams
  # Responsible for fetching a team
  class Find
    include Interactor

    def call
      fail_team_not_found! unless (context.team = team)
    end

    private

    delegate :params, to: :context, private: true

    def team
      @team ||= Team.find_by(id: id)
    end

    def id
      params[:id]
    end

    def fail_team_not_found!
      context.fail!(
        errors: "Team #{id} was not found",
        status: :not_found
      )
    end
  end
end
