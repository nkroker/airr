module DashboardHelper
  def parse_coordinates
    coordinates = []

    @average_aqi_singular.each do |record|
      coordinates << {
        latitude: record['latitude'],
        longitude: record['longitude'],
        label: record['location_name']
      }
    end

    coordinates
  end
end
