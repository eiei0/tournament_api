# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'api/v1/tournaments', type: :request do
  let(:valid_headers) { {} }
  let(:valid_attributes) { attributes_for(:tournament) }
  let(:invalid_attributes) do
    valid_attributes.except(
      *%i[name start_date end_date registration_start_date registration_end_date]
    )
  end

  describe 'GET /index' do
    subject(:req) { get api_v1_tournaments_url, headers: valid_headers, as: :json }

    before do
      create_list(:tournament, 3)

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
    subject(:req) { get api_v1_tournament_url(tournament), as: :json }

    let(:tournament) { create(:tournament) }

    it 'renders a successful response' do
      req

      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    subject(:req) do
      post api_v1_tournaments_url,
           params: { tournament: attributes }, headers: valid_headers, as: :json
    end

    context 'with valid parameters' do
      let(:attributes) { valid_attributes }

      it 'creates a new Tournament' do
        expect { req }.to change(Tournament, :count).by(1)
      end

      it 'renders a JSON response with the new tournament' do
        req

        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      let(:attributes) { invalid_attributes }

      it 'does not create a new Tournament' do
        expect { req }.to change(Tournament, :count).by(0)
      end

      it 'renders a JSON response with errors for the new tournament' do
        req

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'PATCH /update' do
    subject(:req) do
      patch api_v1_tournament_url(tournament),
            params: { tournament: attributes }, headers: valid_headers, as: :json
    end

    context 'with valid parameters' do
      let(:attributes) { { name: 'hi dad' } }
      let(:tournament) { create(:tournament, name: 'hi mom') }

      it 'updates the requested tournament' do
        expect { req }.to change { tournament.reload.name }
          .from(tournament.name).to(attributes[:name])
      end

      it 'renders a JSON response with the tournament' do
        req

        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      let(:tournament) { create(:tournament) }
      let(:attributes) { invalid_attributes.merge(name: nil) }

      it 'renders a JSON response with errors for the tournament' do
        req

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'DELETE /destroy' do
    subject(:req) { delete api_v1_tournament_url(tournament), headers: valid_headers, as: :json }

    let!(:tournament) { create(:tournament) }

    context 'when tournament is destroyed successfully' do
      it 'destroys the requested tournament' do
        expect { req }.to change(Tournament, :count).from(1).to(0)
      end

      it 'returns a 204 status code' do
        req

        expect(response).to have_http_status(:no_content)
      end
    end

    context 'when tournament is destroyed unsuccessfully' do
      before do
        allow(Tournament).to receive(:find_by).and_return(tournament)
        allow(tournament).to receive(:destroy!).and_raise(
          'ActiveRecord::RecordNotDestroyed',
          'unable to destroy record'
        )
      end

      it 'renders a JSON response with errors for the tournament' do
        req

        expect(response).to have_http_status(:conflict)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end
end
