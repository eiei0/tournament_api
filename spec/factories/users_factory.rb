# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    given_name { Faker::Name.first_name }
    family_name { Faker::Name.last_name }
    middle_name { Faker::Name.middle_name }
    nickname { Faker::Hipster.word }
    gender { Faker::Gender.binary_type }

    after(:create, :build, :build_stubbed) do |user|
      user.name = "#{user.given_name} #{user.middle_name}".strip + " #{user.last_name}"
      user.email = Faker::Internet.safe_email(name: user.name)
    end
  end
end
