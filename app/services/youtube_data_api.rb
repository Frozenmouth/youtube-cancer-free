# frozen_string_literal: true

class YoutubeDataApi
  REJECTED_CHANNELS = [
    'Lacrim',
    'EnjoyPhoenix',
    'Bilal Hassani',
    'VINSKY',
    'Snapchat RED',
    'INCROYABLE MAIS VRAI',
    'Topito',
    'Cyprien'
  ].freeze

  def initialize
    @client = Google::Apis::YoutubeV3::YouTubeService.new
    @client.key = ENV['YOUTUBE_API_KEY']
  end

  def trends(country, max_results, page_token = nil)
    @client.list_videos 'snippet', chart: 'mostPopular', region_code: country, max_results: max_results, page_token: page_token
  end

  def countries
    Rails.cache.fetch :countries, expires_in: 1.day do
      Rails.logger.info 'Writing countries to cache'
      @client.list_i18n_regions('snippet', hl: 'en_US').items.map do |country|
        [country.snippet.name, country.snippet.gl]
      end
    end
  end
end
