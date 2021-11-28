# frozen_string_literal: true

class Enrollment < ApplicationRecord
  belongs_to :team
  belongs_to :tournament
end
