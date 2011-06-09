require 'spec_helper'
require 'cove_video_service/client'

describe CoveVideoService::Client do
  include CoveVideoService

  describe ".generate_url" do
    it "should return an invalid video url if request timeout" do
      url = Client.generate_url("test.webm")
      url.should == "http://127.0.0.1:5678/videos/nil.webm"
    end
    it "should return a url with valid token if request does not timeout" do
      Client.expects(:request_token).returns("hello")
      Client.generate_url("blah.webm").should == "http://127.0.0.1:5678/videos/hello.webm"
    end

    it "should allow you to manually set the host" do
      Client.host = "http://chai.ucsd.edu"
      Client.expects(:request_token).returns("hello")
      Client.generate_url("blah.webm").should == "http://chai.ucsd.edu/videos/hello.webm"
    end
  end

end
