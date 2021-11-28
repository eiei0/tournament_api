# frozen_string_literal: true

module Teams
  # Responsible for executing all the operations
  # needed in order to create a Team
  class Create
    include Interactor::Organizer

    organize Build,
             Save
  end
end
