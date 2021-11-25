# frozen_string_literal: true

module Tournaments
  # Responsible for executing all the operations
  # needed in order to update a Tournament
  class Update
    include Interactor::Organizer

    organize Find,
             AssignAttributes,
             Save
  end
end
