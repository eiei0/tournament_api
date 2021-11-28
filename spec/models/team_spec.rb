# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Team, type: :model do
  context 'when testing the team validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  context 'when testing the team associations' do
    it { is_expected.to have_many(:enrollments) }
    it { is_expected.to have_many(:tournaments).through(:enrollments) }
  end
end
