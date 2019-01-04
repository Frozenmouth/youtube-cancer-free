# frozen_string_literal: true

class YoutubeDataApi
  def initialize
    @client = Google::Apis::YoutubeV3::YouTubeService.new
    @client.key = ENV['YOUTUBE_API_KEY']
  end

  def trends(country, max_results)
    @client.list_videos 'snippet', chart: 'mostPopular', region_code: country, max_results: max_results
  end
end
