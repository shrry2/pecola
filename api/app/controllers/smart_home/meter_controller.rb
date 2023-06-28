# frozen_string_literal: true

module SmartHome
  # Meter Controller
  class MeterController < ApplicationController
    def index
      temperature = 26.3
      humidity = 59

      render json: { data: { temperature:, humidity: } }
    end
  end
end
