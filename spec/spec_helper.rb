require "bundler"
Bundler.setup

require "rack/test"
require "rspec"
require "mocha"
require "token-auth-video-server"

ENV['RACK_ENV'] = 'test'
ENV["VIDEO_SERVICE_ROOT"] = File.expand_path("../")

RSpec.configure do |config|
  config.mock_with :mocha
  config.include Rack::Test::Methods
end

def parse_json_response(&block)
  resp = yield
  @response = JSON.parse(resp.body)
end

