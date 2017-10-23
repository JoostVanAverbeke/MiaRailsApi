# spec/support/factory_girl.rb
FactoryGirl.find_definitions
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end