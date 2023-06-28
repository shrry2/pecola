# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ErrorHandler
  # require token authentication for all controllers
  include Authentication
end
