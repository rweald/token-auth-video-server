require "bundler"
Bundler.setup

require "rack/test"
require "rspec"
require "mocha"
require "cove_video_service"

ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|
  config.mock_with :mocha
  config.include Rack::Test::Methods
end

def parse_json_response(&block)
  resp = yield
  @response = JSON.parse(resp.body)
end

