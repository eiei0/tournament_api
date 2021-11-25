# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tournaments::Create do
  describe '.call' do
    subject(:organizer) { described_class.call }

    it 'executes .call on the expected interactors' do
      allow(Tournaments::Build).to receive(:call!)
      allow(Tournaments::Save).to receive(:call!)

      organizer

      expect(Tournaments::Build).to have_received(:call!)
      expect(Tournaments::Save).to have_received(:call!)
    end
  end
end
