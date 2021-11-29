# frozen_string_literal: true

class Team < ApplicationRecord
  validates :name, presence: true

  has_many :enrollments, dependent: :destroy
  has_many :tournaments, through: :enrollments
  has_many :rosters, dependent: :destroy
  has_many :players, through: :rosters
end
