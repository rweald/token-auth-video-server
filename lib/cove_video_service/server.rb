require 'redis'
require 'redis-namespace'
require 'sinatra/base'
require 'yajl/json_gem'

class VideoService < Sinatra::Base
  enable :logging
  @redis = Redis::Namespace.new "video_service", :redis => Redis.new



end
