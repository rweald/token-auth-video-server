require 'spec_helper'

describe CoveVideoService do
  describe VideoService do
    def app
      VideoService
    end

    describe "GET 'generate_token'" do
      it "should return 400 if no video given" do
        get '/generate_token'
        last_response.status.should == 400
      end

      it "should return a notice that you must specify a video if no video given" do
        parse_json_response do
          get '/generate_token'
        end
        @response["notice"].should be
      end

      it "should return 200 if valid video given" do
        get '/generate_token', :video => "test.webm"
        last_response.status.should == 200
      end

      it "shoud return a token if valid video param given" do
        parse_json_response do
          get "/generate_token", :video => "test.webm"
        end
        @response["token"].should be
      end
      
    end
  end
end
