%w[
  Mumbai
  Delhi
  Chennai
  Kolkata
  Hyderabad
  Pune
  Jaipur
  Surat
  Lucknow
  Kanpur
  Nagpur
  Patna
  Indore
  Thane
  Bhopal
  Ludhiana
  Agra
  Nashik
  Dewas
  Varanasi
].each do |city|
  puts "== Fetching details for #{city}...".blue.bold
  response = PollutionStatService.get_city_details(city:)

  Location.create(
    name: response['name'],
    lat: response['lat'],
    lon: response['lon']
  )
  puts "== Location record created for #{city}.".green
end

puts '== Fetching and importing historic records...'.blue.bold
HistoricRecordFetcherJob.new.perform('fetch_stat')
puts '== Historic records imported.'.green
