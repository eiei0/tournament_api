# frozen_string_literal: true

module Teams
  # Responsible for executing all the operations
  # needed in order to delete a Teams
  class Destroy
    include Interactor::Organizer

    organize Find,
             Delete
  end
end
