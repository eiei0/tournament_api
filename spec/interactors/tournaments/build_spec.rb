# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tournaments::Build do
  describe '.call' do
    subject(:interactor) { described_class.call(params: params) }

    let(:params) { instance_double('ActionController::Params') }

    before do
      allow(params).to receive(:require).with(:tournament).and_return(params)
      allow(params).to receive(:permit).with(
        :name, :start_date, :end_date, :registration_start_date,
        :registration_end_date, :description, :team_cap
      ).and_return(permitted_params)
    end

    context 'when the tournament is valid' do
      let(:permitted_params) { attributes_for(:tournament) }

      it 'sets the newly created assessment to the context' do
        expect(interactor.tournament).to be_an(Tournament)
      end

      it 'persists the expected values on the assessment record' do
        expect(interactor.tournament).to have_attributes(**permitted_params)
      end
    end

    context 'when the tournament is invalid' do
      let(:permitted_params) { attributes_for(:tournament).merge(name: nil) }

      it { expect(interactor).to be_failure }

      it 'raises an invalid argument error' do
        expect(interactor.errors).to include("Name can't be blank")
      end
    end
  end
end
