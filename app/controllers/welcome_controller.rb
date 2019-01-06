# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    youtube_data_api = YoutubeDataApi.new

    next_page_token = nil
    @videos = []
    loop do
      response = youtube_data_api.trends('FR', 50, next_page_token)
      result, errors = response
      raise StandardError, errors.to_s unless errors.nil?

      next_page_token = response.next_page_token
      trending_videos = result.items
      @videos += trending_videos.reject do |video|
        YoutubeDataApi::REJECTED_CHANNELS.any? do |rejected_channel|
          video.snippet.channel_title.include? rejected_channel
        end
      end

      break if next_page_token.nil?
    end
  end
end
