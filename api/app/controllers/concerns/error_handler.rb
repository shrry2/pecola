# frozen_string_literal: true

# Common error handler
module ErrorHandler
  extend ActiveSupport::Concern

  included do
    rescue_from StandardError do |e|
      logger.error(e)
      render_error('something went wrong', :internal_server_error)
    end

    rescue_from UnauthorizedError do
      render_error('unauthorized', :unauthorized)
    end
  end

  private

  def render_error(message, status)
    render json: { message: }, status:
  end
end
