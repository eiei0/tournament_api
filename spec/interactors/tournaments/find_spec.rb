# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tournaments::Find do
  describe '.call' do
    subject(:interactor) { described_class.call(id: id) }

    let(:tournament) { create(:tournament) }

    context 'when the tournament exists' do
      let(:id) { tournament.id.to_s }

      it { expect(interactor).to be_success }
    end

    context 'when the tournament does not exist' do
      let(:id) { '8675309' }

      it { expect(interactor).to be_failure }

      it 'returns a not found error message' do
        expect(interactor.errors).to eq("Tournament #{id} was not found")
      end

      it 'returns a not_found status code' do
        expect(interactor.status).to eq(:not_found)
      end
    end
  end
end
