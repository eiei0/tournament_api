# frozen_string_literal: true

class Tournament < ApplicationRecord
  validates :name,
            :start_date,
            :end_date,
            :registration_start_date,
            :registration_end_date,
            presence: true

  has_many :enrollments, dependent: :destroy
  has_many :teams, through: :enrollments
end
