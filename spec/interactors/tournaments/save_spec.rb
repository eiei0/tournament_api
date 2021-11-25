# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tournaments::Save do
  describe '.call' do
    subject(:interactor) { described_class.call(tournament: tournament) }

    context 'when the tournament is valid' do
      let(:tournament) { build(:tournament) }

      it { expect(interactor).to be_success }
    end

    context 'when the tournament is invalid' do
      let(:tournament) { build(:tournament, name: nil) }

      it { expect(interactor).to be_failure }

      it 'raises an invalid argument error' do
        expect(interactor.errors).to include("Name can't be blank")
      end
    end
  end
end
