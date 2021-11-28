# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/teams', type: :request do
  include_context 'with authorized user'

  let(:valid_headers) { {} }
  let(:valid_attributes) { attributes_for(:team) }
  let(:invalid_attributes) { { name: nil } }

  describe 'GET /index' do
    subject(:req) { get api_v1_teams_url, headers: valid_headers, as: :json }

    before do
      create_list(:team, 3)

      req
    end

    it 'renders a successful response' do
      expect(response).to be_successful
    end

    it 'returns a collection of tournaments' do
      expect(JSON.parse(response.body).count).to eq(3)
    end
  end

  describe 'GET /show' do
    subject(:req) { get api_v1_team_url(team), as: :json }

    let(:team) { create(:team) }

    it 'renders a successful response' do
      req

      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    subject(:req) do
      post api_v1_teams_url,
           params: { team: attributes }, headers: valid_headers, as: :json
    end

    context 'with valid parameters' do
      let(:attributes) { valid_attributes }

      it 'creates a new Team' do
        expect { req }.to change(Team, :count).by(1)
      end

      it 'renders a JSON response with the new team' do
        req

        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      let(:attributes) { invalid_attributes }

      it 'does not create a new Team' do
        expect { req }.to change(Team, :count).by(0)
      end

      it 'renders a JSON response with errors for the new team' do
        req

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'PATCH /update' do
    subject(:req) do
      patch api_v1_team_url(team),
            params: { team: attributes }, headers: valid_headers, as: :json
    end

    context 'with valid parameters' do
      let(:attributes) { { name: 'hi dad' } }
      let(:team) { create(:team, name: 'hi mom') }

      it 'updates the requested team' do
        expect { req }.to change { team.reload.name }
          .from(team.name).to(attributes[:name])
      end

      it 'renders a JSON response with the team' do
        req

        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      let(:team) { create(:team) }
      let(:attributes) { invalid_attributes }

      it 'renders a JSON response with errors for the team' do
        req

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'DELETE /destroy' do
    subject(:req) { delete api_v1_team_url(team), headers: valid_headers, as: :json }

    let!(:team) { create(:team) }

    it 'destroys the requested team' do
      expect { req }.to change(Team, :count).from(1).to(0)
    end

    it 'returns a 204 status code' do
      req

      expect(response).to have_http_status(:no_content)
    end
  end
end
