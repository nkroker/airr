# frozen_string_literal: true

# == Schema Information
#
# Table name: locations
#
#  id   :integer          not null, primary key
#  name :string
#  lat  :decimal
#  lon  :decimal
#  created_at :datetime    not null
#  updated_at :datetime    not null
#
# The Location model represents geographical locations where pollution data is collected.
# Each location has many pollution records, represented by the PollutionData model.
#
class Location < ApplicationRecord
  has_many :pollution_records, class_name: 'PollutionData'
end
