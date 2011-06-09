#!/usr/bin/env ruby

$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '/../lib')

require 'vegas'
require "cove_video_service/server"

Vegas::Runner.new(VideoService, 'video_service', :skip_launch => true, :foreground => true)


