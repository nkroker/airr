class PollutionReportFetcherJob < ApplicationJob
  queue_as :default

  def perform(action)
    send(action)
  rescue StandardError => e
    Rails.logger.error "Failed to perform action: #{action}, Error: #{e.message}, caller: #{e.backtrace}"
  end

  def fetch_stat
    Location.find_each(batch_size: 100) do |location|
      import_stat(
        response: PollutionStatService.current_aqi(location_id: location.id),
        location_id: location.id
      )
    end
  end

  def import_stat(response: nil, location_id: nil)
    return unless response

    pollution_data = message_response(response:)

    PollutionData.find_or_create_by(
      pollution_data.merge(location_id:)
    )
  end

  def message_response(response: nil)
    stat = response['list'].first

    merge_stats(stat)
  end

  def merge_stats(stat)
    merged_stats = stat['main'].merge(stat['components'])
    merged_stats[:recorded_at] = Time.zone.at(stat['dt'])

    merged_stats.deep_symbolize_keys
  end
end
