require 'httparty'

module Client
  class OpenWeather
    class << self
      def host
        'http://api.openweathermap.org'
      end

      def http_request(method:, path:, query: nil) # rubocop:disable  Metrics/ParameterLists
        start_time = Time.now

        HTTParty.send(method, "#{host}#{path}?#{query}&appid=#{ENV['OPEN_WEATHER_API_KEY']}")
      rescue StandardError => e
        Rails.logger.error(
          error: e.message,
          method: method,
          url: (host + path),
          params: params,
          total_duration_ms: ((Time.now - start_time) * 1000).round
        )

        raise e
      end
    end
  end
end
