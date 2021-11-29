# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Teams::RostersController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/api/v1/teams/1/rosters').to route_to('api/v1/teams/rosters#create', team_id: '1')
    end
  end
end
