# frozen_string_literal: true

FactoryBot.define do
  factory :tournament do
    name { Faker::Lorem.sentence(word_count: 3) }
    start_date { 30.days.from_now.utc }
    end_date { 32.days.from_now.utc }
    registration_start_date { 2.days.from_now.utc }
    registration_end_date { 29.days.from_now.utc }
    description { Faker::Lorem.paragraph(sentence_count: 4) }
    team_cap { 10 }
  end
end
