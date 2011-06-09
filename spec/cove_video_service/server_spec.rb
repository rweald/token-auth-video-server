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
      
    end
  end
end
