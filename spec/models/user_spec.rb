# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:given_name) }
  it { is_expected.to validate_presence_of(:family_name) }
  it { is_expected.to validate_presence_of(:email) }
end
