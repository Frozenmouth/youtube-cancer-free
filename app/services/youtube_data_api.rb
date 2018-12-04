# frozen_string_literal: true

require 'google/apis'
require 'google/apis/youtube_v3'

class YoutubeDataApi
  def initialize
    @client = Google::Apis::YoutubeV3::YouTubeService.new
    @client.key = ENV['YOUTUBE_API_KEY']
  end

  attr_reader :client
end
