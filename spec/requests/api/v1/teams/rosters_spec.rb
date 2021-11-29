# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Teams::Rosters', type: :request do
  include_context 'with authorized user'

  describe 'POST /rosters' do
    subject(:req) { post "/api/v1/teams/#{team.id}/rosters" }

    let(:team) { create(:team) }

    it 'returns http success' do
      req

      expect(response).to have_http_status(:success)
    end
  end
end
