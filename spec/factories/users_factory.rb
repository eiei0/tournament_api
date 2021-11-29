# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    given_name { Faker::Name.first_name }
    family_name { Faker::Name.last_name }
    middle_name { Faker::Name.middle_name }
    nickname { Faker::Hipster.word }
    gender { Faker::Gender.binary_type }
    password { 'taco1234' }
    password_confirmation { 'taco1234' }

    after(:create, :build, :build_stubbed) do |user|
      user.name = "#{user.given_name} #{user.middle_name}".strip + " #{user.family_name}"
      user.email = Faker::Internet.safe_email(name: user.name)
    end
  end
end
