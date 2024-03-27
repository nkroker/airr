# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Location.insert_all(
  [
    {
      name: "Mumbai",
      lat: 19.0760,
      long: 72.8777
    },
    {
      name: "Delhi",
      lat: 28.7041,
      long: 77.1025
    },
    {
      name: "Bangalore",
      lat: 12.9716,
      long: 77.5946
    },
    {
      name: "Hyderabad",
      lat: 17.3850,
      long: 78.4867
    },
    {
      name: "Chennai",
      lat: 13.0827,
      long: 80.2707
    },
    {
      name: "Kolkata",
      lat: 22.5726,
      long: 88.3639
    },
    {
      name: "Jaipur",
      lat: 26.9124,
      long: 75.7873
    },
    {
      name: "Lucknow",
      lat: 26.8467,
      long: 80.9462
    },
    {
      name: "Ahmedabad",
      lat: 23.0225,
      long: 72.5714
    },
    {
      name: "Pune",
      lat: 18.5204,
      long: 73.8567
    },
    {
      name: "Surat",
      lat: 21.1702,
      long: 72.8311
    },
    {
      name: "Kanpur",
      lat: 26.4499,
      long: 80.3319
    },
    {
      name: "Nagpur",
      lat: 21.1458,
      long: 79.0882
    },
    {
      name: "Indore",
      lat: 22.7196,
      long: 75.8577
    },
    {
      name: "Thane",
      lat: 19.2183,
      long: 72.9781
    },
    {
      name: "Bhopal",
      lat: 23.2599,
      long: 77.4126
    },
    {
      name: "Visakhapatnam",
      lat: 17.6868,
      long: 83.2185
    },
    {
      name: "Patna",
      lat: 25.5941,
      long: 85.1376
    },
    {
      name: "Ludhiana",
      lat: 30.9000,
      long: 75.8573
    },
    {
      name: "Agra",
      lat: 27.1767,
      long: 78.0081
    }
  ]
)



