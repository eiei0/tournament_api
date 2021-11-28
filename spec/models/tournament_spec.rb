# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tournament, type: :model do
  context 'when testing the tournament validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:start_date) }
    it { is_expected.to validate_presence_of(:end_date) }
    it { is_expected.to validate_presence_of(:registration_start_date) }
    it { is_expected.to validate_presence_of(:registration_end_date) }
  end

  context 'when testing the tournament associations' do
    it { is_expected.to have_many(:enrollments) }
    it { is_expected.to have_many(:teams).through(:enrollments) }
  end
end
