require 'rails_helper'

RSpec.describe PollutionStatService, type: :model do
  describe '.get_city_details' do
    context 'when the city is valid' do
      let(:city) { 'Orlando' }
      let(:response_body) { { 'name' => 'Orlando', 'state' => 'Florida', 'country' => 'US' } }

      it 'returns city details', :vcr do
        response = PollutionStatService.get_city_details(city: city)

        expect(response).to have_key('lat')
        expect(response).to have_key('lon')
        expect(response).to have_key('local_names')
        expect(response.slice('name', 'state', 'country')).to eq(response_body)
      end
    end

    context 'when the city is invalid' do
      let(:city) { 'InvalidCity' }

      before do
        allow(Client::OpenWeather).to receive(:http_request).and_raise(StandardError)
      end

      it 'raises PollutionStatServiceError', :vcr do
        expect { PollutionStatService.get_city_details(city: city) }.to raise_error(PollutionStatServiceError)
      end
    end
  end

  describe '.historic_aqi' do
    context 'when location_id is provided' do
      let!(:location_id) { 1 }
      let!(:location) { create(:location, id: location_id) }

      xit 'returns historic AQI data', :vcr do
        response = PollutionStatService.historic_aqi(location_id: location_id)

        expect(response).to have_key('coord')
        expect(response).to have_key('list')
        expect(response['coord']).to eq({ 'lat' => lat, 'lon' => lon })
      end
    end
  end

  describe '.current_aqi' do
    context 'when the city is valid' do
      let!(:location) { create(:location, id: 1) }
      let!(:location_id) { location.id }

      it 'returns city details', :vcr do
        response = PollutionStatService.current_aqi(location_id: location_id)

        expect(response).to have_key('coord')
        expect(response).to have_key('list')
        expect(response['coord']).to eq({ 'lat' => location.lat.to_f, 'lon' => location.lon.to_f })
        expect(response['list'].count).to eq(1)
      end
    end

    context 'when the city is invalid' do
      let(:location_id) { 'InvalidCity' }

      before do
        allow(Client::OpenWeather).to receive(:http_request).and_raise(StandardError)
      end

      it 'raises PollutionStatServiceError', :vcr do
        expect { PollutionStatService.current_aqi(location_id:) }.to raise_error(PollutionStatServiceError)
      end
    end
  end
end
