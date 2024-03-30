# frozen_string_literal: true

class PollutionStatServiceError < StandardError; end

class PollutionStatService
  class << self
    def get_city_details(city: nil)
      safe_call do
        resp = Client::OpenWeather.http_request(
          method: :get,
          path: '/geo/1.0/direct',
          query: "q=#{city}"
        )

        JSON.parse(resp.body).first
      end
    end

    def get_historic_aqi(location_id: nil, from: 30.days.ago, to: DateTime.now)
      safe_call do
        return [] unless location_id.present?

        location = Location.find(location_id)
        query_params = { lat: location.lat, lon: location.lon, start: from.to_i, end: to.to_i }.to_query

        resp = Client::OpenWeather.http_request(
          method: :get,
          path: '/data/2.5/air_pollution/history',
          query: query_params
        )

        JSON.parse(resp.body)
      end
    end

    def current_aqi(location_id: nil)
      safe_call do
        return [] unless location_id.present?

        location = Location.find(location_id)

        resp = Client::OpenWeather.http_request(
          method: :get,
          path: '/data/2.5/air_pollution',
          query: {
            lat: location.lat,
            lon: location.lon
          }.to_query
        )

        JSON.parse(resp.body)
      end
    end

    private

    def safe_call
      yield
    rescue StandardError => e
      raise PollutionStatServiceError.new(e.message)
    end
  end
end
