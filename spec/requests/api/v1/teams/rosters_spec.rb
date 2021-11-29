# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Teams::Rosters', type: :request do
  include_context 'with authorized user'

  describe 'POST /rosters' do
    subject(:req) { post "/api/v1/teams/#{team.id}/rosters", params: { user_ids: users.map(&:id) } }

    let(:users) { create_list(:user, 3) }

    context 'with valid parameters' do
      let(:team) { create(:team) }

      it 'returns http success' do
        req

        expect(response).to have_http_status(:success)
      end

      it 'adds the users to the team roster' do
        expect { req }.to change { team.players.reload.count }.from(0).to(users.count)
      end
    end

    context 'with invalid parameters' do
      let(:team) { build_stubbed(:team) }

      it 'returns http not found' do
        req

        expect(response).to have_http_status(:not_found)
      end

      it 'fails to add the users to the team roster' do
        expect { req }.not_to change { team.players.reload.count }.from(0)
      end
    end
  end
end
