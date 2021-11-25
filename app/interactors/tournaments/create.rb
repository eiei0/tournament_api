# frozen_string_literal: true

module Tournaments
  # Responsible for executing all the operations
  # needed in order to create a Tournament
  class Create
    include Interactor::Organizer

    organize Build,
             Save
  end
end
