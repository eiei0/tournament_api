# frozen_string_literal: true

module Rosters
  # Responsible for executing all the operations
  # needed in order to add one or more players to
  # a team roster
  class Build
    include Interactor::Organizer

    organize Teams::Find,
             Users::List,
             AddPlayers
  end
end
