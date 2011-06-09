require 'yajl/json_gem'
require 'rest-client'

module CoveVideoService
  class Client
    class << self
      attr_accessor :host
    end
    @host = "http://127.0.0.1:5678"

    def self.generate_url(video_name)
      format = video_name.split(".")[1]
      begin
        token = self.request_token(video_name)
      rescue
        token = "nil"
      end     
      @host + "/videos/" + "#{token}.#{format}"
    end

    def self.request_token(video_name)
      url = @host + "/generate_token" + "?video=#{video_name}"
      resp = Restclient::Request.execute(:method => :get, :url => url, :timeout => 0.75)
      resp = JSON.parse(resp.body)
      resp["token"]
    end
  end
  
end
