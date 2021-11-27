# frozen_string_literal: true

# Responsible for handling all user data logic
class User < ApplicationRecord
  validates :given_name,
            :family_name,
            :email,
            presence: true
end
