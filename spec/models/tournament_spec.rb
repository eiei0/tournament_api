# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tournament, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:start_date) }
    it { is_expected.to validate_presence_of(:end_date) }
    it { is_expected.to validate_presence_of(:registration_start_date) }
    it { is_expected.to validate_presence_of(:registration_end_date) }
  end
end
