class LocationRepository
  class << self
    def calculate_avg_aqi
      locations_data = Location.connection.execute(
        %{
          SELECT locations.name as location_name, avg(pollution_data.aqi) as average_aqi
          FROM locations
          INNER JOIN pollution_data
          ON locations.id = pollution_data.location_id
          GROUP BY locations.id, locations.name
        }
      ).to_a

      locations_data.each_with_object({}) do |hash, result|
        result[hash['location_name']] = hash['average_aqi']
      end.to_a
    end

    def calculate_avg_aqi_by_location(location_id: nil) # rubocop:disable Metrics/MethodLength
      return [] unless location_id

      location_data = Location.connection.execute(%{
          SELECT
            locations.name as location_name,
            avg(pollution_data.aqi) as average_aqi
          FROM locations
          INNER JOIN pollution_data
          ON locations.id = pollution_data.location_id
          WHERE locations.id = #{location_id}
          GROUP BY locations.id, locations.name
      }).to_a

      location_data.each_with_object({}) do |hash, result|
        result[hash['location_name']] = hash['average_aqi']
      end.to_a
    end
  end
end
