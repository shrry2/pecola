# frozen_string_literal: true

require 'switchbot'

SWITCHBOT_METER_DEVICE_ID = ENV.fetch('SWITCHBOT_METER_DEVICE_ID', '')

module SmartHome
  # Meter Controller
  class MeterController < ApplicationController
    def index
      switchbot_client = Switchbot::Client.new(
        ENV.fetch('SWITCHBOT_TOKEN', ''),
        ENV.fetch('SWITCHBOT_SECRET', '')
      )

      meter_status = switchbot_client.device(SWITCHBOT_METER_DEVICE_ID).status[:body]

      # extract temperature and humidity
      temperature = meter_status[:temperature]
      humidity = meter_status[:humidity]

      render json: { data: { temperature:, humidity: } }
    end
  end
end
