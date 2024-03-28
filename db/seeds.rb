[
  "Chicago",
  "Houston",
  "Phoenix",
  "Miami",
  "Denver",
  "Seattle",
  "Dallas",
  "Austin",
  "Boston",
  "Atlanta",
  "Portland",
  "Detroit",
  "Orlando",
  "Tampa",
  "Memphis",
  "Charlotte",
  "Oakland",
  "Raleigh",
  "Sacramento",
  "Wichita"
].each do |city|
  response = PollutionStatService.get_city_details(city: city)

  Location.create(
    name: response['name'],
    lat: response['lat'],
    lon: response['lon']
  )
end
