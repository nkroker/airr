# app/models/pollution_importer.rb
module PollutionImporter
  def self.import
    response = HTTP.get("http://api.openweathermap.org/data/2.5/air_pollution", query: {lat: "YOUR_LATITUDE", lon: "YOUR_LONGITUDE"})
    #parse and save the data to the database
  end
end