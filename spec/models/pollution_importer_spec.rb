require "rails_helper"

module PollutionImporter
  RSpec.describe "PollutionImporter" do
    describe ".import" do
      around do |example|
        VCR.use_cassette("pollution_importer") { example.run }
      end

      it "imports pollution data" do
        #test importing the data
      end
    end
  end
end
