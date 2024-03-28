require 'rails_helper'

RSpec.describe PollutionStatService, type: :model do
  describe '.get_city_details' do
    context 'when the city is valid' do
      let(:city) { 'Orlando' }
      let(:response_body) { { 'name' => 'Orlando', 'state' => 'Florida', 'country' => 'US' } }

      # before do
      #   allow(Client::OpenWeather).to receive(:http_request).and_return(OpenStruct.new(body: response_body.to_json))
      # end

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
end
