# frozen_string_literal: true

RSpec.shared_context 'with authorized user', shared_context: :metadata do
  let(:current_user) { build_stubbed(:user) }

  before do
    allow_any_instance_of(Api::V1::ApplicationController)
      .to receive(:doorkeeper_authorize!)
      .and_return(true)
  end
end
