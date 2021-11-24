# frozen_string_literal: true

# Base class for all ActiveRecord model classes
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
