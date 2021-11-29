# frozen_string_literal: true

class Roster < ApplicationRecord
  belongs_to :player, class_name: 'User', optional: false
  belongs_to :team
end
