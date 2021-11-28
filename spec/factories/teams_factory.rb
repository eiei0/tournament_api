# frozen_string_literal: true

FactoryBot.define do
  factory :team do
    name { Faker::Team.name }
    player_count { 0 }
  end
end
