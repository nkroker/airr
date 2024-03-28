# frozen_string_literal: true

require 'webmock/rspec'
if Rails.env.test?
  WebMock.disable_net_connect!(allow_localhost: true)
end

RSpec.configure do |config|
  config.before do
    # Public Api
    stub_request(:any, /.*someapi.com*/).to_return(status: 200, body: {}.to_json, headers: {})
  end
end
