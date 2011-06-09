require 'yajl/json_gem'
require 'rest-client'

module TAVideoServer
  class Client
    class << self
      attr_accessor :host
    end
    @host = "http://127.0.0.1:5678"

    def self.generate_url(video_name)
      format = video_name.split(".")[1] || "webm"
      begin
        token = self.request_token(video_name)
      rescue
        puts "token request failed or timedout"
        token = "nil"
      end     
      @host + "/videos/" + "#{token}.#{format}"
    end

    def self.request_token(video_name)
      puts "begining token request"
      url = @host + "/generate_token" + "?video=#{video_name}"
      resp = Restclient::Request.execute(:method => :get, :url => url, :timeout => 0.75)
      resp = JSON.parse(resp.body)
      puts "token request succeeded"
      resp["token"]
    end
  end
  
end
