# frozen_string_literal: true

class PollutionStatServiceError < StandardError ; end

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

    private

    def safe_call
      yield
    rescue StandardError
      PollutionStatServiceError.new
    end
  end
end
