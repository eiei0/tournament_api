# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Tournaments::Registrations', type: :request do
  include_context 'with authorized user'

  describe 'POST /create' do
    subject(:req) { post "/api/v1/tournaments/#{tournament.id}/register", params: params }

    let(:tournament) { create(:tournament) }
    let(:params) { { team_ids: teams.map(&:id) } }
    let(:teams) { create_list(:team, 3) }

    it 'returns http success' do
      req

      expect(response).to have_http_status(:success)
    end
  end
end
