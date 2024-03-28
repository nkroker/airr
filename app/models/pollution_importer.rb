module PollutionImporter
  def self.import
    Location.all.each do |location|
      response = HTTP.get("http://api.openweathermap.org/data/2.5/air_pollution", query: {lat: location.lat, lon: location.long})
    end
  end
end
