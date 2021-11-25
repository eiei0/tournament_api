# frozen_string_literal: true

class Tournament < ApplicationRecord
  validates :name,
            :start_date,
            :end_date,
            :registration_start_date,
            :registration_end_date,
            presence: true
end
