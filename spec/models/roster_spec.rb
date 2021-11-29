# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Roster, type: :model do
  context 'when testing the team associations' do
    it { is_expected.to belong_to(:player).class_name('User') }
    it { is_expected.to belong_to(:team) }
  end
end
