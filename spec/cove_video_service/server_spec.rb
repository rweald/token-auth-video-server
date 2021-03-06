require 'spec_helper'

describe TAVideoServer do
  describe VideoServer do
    def app
      VideoServer
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
        get '/generate_token', :video => "test.m4v"
        last_response.status.should == 200
      end

      it "shoud return a token if valid video param given" do
        parse_json_response do
          get "/generate_token", :video => "test.m4v"
        end
        @response["token"].should be
      end
    end

    describe "get '/videos/:token'" do
      def get_token(name)
        resp = get '/generate_token', :video => name
        resp = JSON.parse(resp.body)
        resp["token"]
      end
      
      it "should return 403 if not valid token" do
        get '/videos/adljfs.webm'
        last_response.status.should == 403
      end

      it 'should return 200 if token is valid' do
        token = get_token("test.webm")
        get "/videos/#{token}.webm"
        last_response.status.should == 200
      end
    end
  end
end
