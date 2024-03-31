# frozen_string_literal: true

# The DashboardController is responsible for handling requests related to the dashboard view.
class DashboardController < ApplicationController
  skip_forgery_protection only: [:show_city_aqi]

  def index
    @average_aqi =
      LocationRepository.calculate_avg_aqi

    @location = Location.first

    @average_aqi_singular =
      LocationRepository.calculate_avg_aqi_by_location(location_id: @location.id)
  end

  def show_city_aqi
    @location = Location.find(params[:location])

    @average_aqi_singular = LocationRepository.calculate_avg_aqi_by_location(location_id: @location.id)

    respond_to do |f|
      f.json do
        render json: { data: @average_aqi_singular, title: @location.name }
      end
    end
  end
end
