class HistoricRecordFetcherJob < ApplicationJob
  queue_as :critical

  def perform(action)
    send(action)
  rescue StandardError => e
    Rails.logger.error "Failed to perform action: #{action}, Error: #{e.message}, caller: #{e.backtrace}"
  end

  def fetch_stat
    Location.find_each(batch_size: 100) do |location|
      import_stat(
        response: PollutionStatService.get_historic_aqi(location_id: location.id),
        location_id: location.id
      )
    end
  end

  def import_stat(response: nil, location_id: nil)
    return unless response

    PollutionData.insert_all(
      message_response(response:, location_id:)
    )
  end

  def message_response(response: nil, location_id: nil)
    response['list'].map do |stat|
      merge_stats(stat).merge(location_id:)
    end
  end

  def merge_stats(stat)
    merged_stats = stat['main'].merge(stat['components'])
    merged_stats[:recorded_at] = Time.zone.at(stat['dt'])

    merged_stats.deep_symbolize_keys
  end
end
