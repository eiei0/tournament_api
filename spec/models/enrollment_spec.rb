# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Enrollment, type: :model do
  context 'when testing the enrollment associations' do
    it { is_expected.to belong_to(:team) }
    it { is_expected.to belong_to(:tournament) }
  end
end
