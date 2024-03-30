# frozen_string_literal: true
class StatImporterService
  class << self
    def import_stat(json_response: nil)
      return unless json_response.present?
      resp = Client::OpenWeather.http_request(
        method: :get,
        path: '/geo/1.0/direct',
        query: "q=#{city}"
      )

      JSON.parse(resp.body).first
    end
  end
end
