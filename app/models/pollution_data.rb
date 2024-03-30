# The PollutionData class is an ActiveRecord model that represents the pollution data
# collected at various locations. It is linked to the `pollution_data` table in the database.
# Each record of pollution data includes attributes like Air Quality Index (AQI) and is
# associated with a specific location through the `location_id` field, establishing a
# one-to-one relationship with the Location model. This class enables the creation,
# querying, and manipulation of pollution data records within a Ruby on Rails application,
# ensuring that each piece of data is accurately tied to a geographical location.
#
# Associations:
#   - belongs_to :location - Indicates that each PollutionData record is associated with
#     one Location record. The `location_id` column in the `pollution_data` table serves
#     as the foreign key.
#
# Example Usage:
#   To associate a pollution data record with a location, you can create a new PollutionData
#   instance and assign it to a location like so:
#
#   pollution_data = PollutionData.new(aqi: 150)
#   pollution_data.location = Location.find_by(name: 'Downtown')
#   pollution_data.save
#
#   This will create a new pollution data record with an AQI of 150 and associate it with
#   the 'Downtown' location.
class PollutionData < ApplicationRecord
  belongs_to :location
end
