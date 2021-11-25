# frozen_string_literal: true

module Tournaments
  # Responsible for executing all the operations
  # needed in order to delete a Tournament
  class Destroy
    include Interactor::Organizer

    organize Find,
             Delete
  end
end
