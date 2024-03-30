RSpec.configure do |config|
  config.before(:suite) do
    FactoryBot.definition_file_paths = Dir['*/*/spec/factories']
    FactoryBot.find_definitions
  end

  config.include FactoryBot::Syntax::Methods
end
