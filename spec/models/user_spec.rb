# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when testing the team validations' do
    it { is_expected.to validate_presence_of(:given_name) }
    it { is_expected.to validate_presence_of(:family_name) }
    it { is_expected.to validate_presence_of(:email) }
  end

  context 'when testing the team associations' do
    it { is_expected.to have_many(:rosters).inverse_of(:player) }
    it { is_expected.to have_many(:teams).through(:rosters) }
  end
end
