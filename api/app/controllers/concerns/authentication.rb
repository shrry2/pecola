# frozen_string_literal: true

# Purpose: Authentication concern for API controllers.
module Authentication
  extend ActiveSupport::Concern
  include ActionController::HttpAuthentication::Token::ControllerMethods

  included do
    before_action :authenticate
  end

  private

  def authenticate
    authenticate_token || raise_authentication_error
  end

  def authenticate_token
    authenticate_with_http_token do |token, _options|
      ActiveSupport::SecurityUtils.secure_compare(token, ENV.fetch('API_TOKEN', nil))
    end
  end

  def raise_authentication_error
    raise UnauthorizedError
  end
end
