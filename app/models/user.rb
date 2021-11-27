# frozen_string_literal: true

# Responsible for handling all user data logic
class User < ApplicationRecord
  has_secure_password

  validates :given_name,
            :family_name,
            :email,
            presence: true

  has_many :access_grants,
           inverse_of: 'user',
           class_name: 'Doorkeeper::AccessGrant',
           foreign_key: :resource_owner_id,
           dependent: :delete_all

  has_many :access_tokens,
           inverse_of: 'user',
           class_name: 'Doorkeeper::AccessToken',
           foreign_key: :resource_owner_id,
           dependent: :delete_all
end
