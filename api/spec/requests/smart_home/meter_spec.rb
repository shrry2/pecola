# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/smart_home/meter' do
  include Committee::Rails::Test::Methods

  let(:api_token) { ENV.fetch('API_TOKEN', nil) }

  # @see https://github.com/willnet/committee-rails
  def committee_options
    @committee_options ||= {
      schema_path: Rails.root.join('schema/reference/pecola-api.yml').to_s
    }
  end

  describe 'GET /smart_home/meter' do
    context 'with valid token' do
      before do
        get '/smart_home/meter',
            headers: {
              'Authorization' => ActionController::HttpAuthentication::Token.encode_credentials(api_token)
            }
      end

      it 'returns a 200 status' do
        expect(response).to have_http_status(:ok)
      end

      it 'conforms to response schema' do
        assert_response_schema_confirm
      end

      it 'returns a valid json' do
        expect(response.body).to be_json_including(data: {
                                                     temperature: a_kind_of(Float),
                                                     humidity: a_kind_of(Integer)
                                                   })
      end
    end

    context 'with invalid token' do
      before do
        get '/smart_home/meter',
            headers: {
              'Authorization' => ActionController::HttpAuthentication::Token.encode_credentials('invalid_token')
            }
      end

      it 'returns a 401 status' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
