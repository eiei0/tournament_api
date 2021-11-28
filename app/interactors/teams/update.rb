# frozen_string_literal: true

module Teams
  # Responsible for executing all the operations
  # needed in order to update a Team
  class Update
    include Interactor::Organizer

    organize Find,
             AssignAttributes,
             Save
  end
end
