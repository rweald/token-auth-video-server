require 'yajl/json_gem'
require 'rest-client'

module TAVideoServer
  class Client
    class << self
      attr_accessor :url_host, :token_host
    end
    @url_host = "http://127.0.0.1:4250"
    @token_host = "http://127.0.0.1:4250"

    def self.generate_url(video_name, timeout=1.5)
      format = video_name.split(".")[1] || "webm"
      begin
        token = self.request_token(video_name, timeout)
      rescue => e
        puts "token request failed or timed out"
        puts "Reason for failure was #{e}"
        token = "nil"
      end     
      @url_host + "/videos/" + "#{token}.#{format}"
    end

    def self.request_token(video_name, timeout)
      puts "begining token request"

      url = @token_host + "/generate_token" + "?video=#{video_name}"
      resp = RestClient::Request.execute(:method => :get, :url => url, :timeout => timeout)
      resp = JSON.parse(resp.body)

      puts "token request succeeded"
      resp["token"]
    end
  end
  
end
