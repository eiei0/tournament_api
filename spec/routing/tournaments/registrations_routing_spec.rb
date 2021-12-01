# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Tournaments::RegistrationsController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/api/v1/tournaments/1/register')
        .to route_to('api/v1/tournaments/registrations#create', tournament_id: '1')
    end
  end
end
