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
    'SkyrockFM',
    'Ennahar tv',
    'Troom Troom FR',
    'Booska-P.com',
    'Touche pas à mon poste !',
    'Konbini',
    'Foot Mercato',
    'Marodi TV Sénégal',
    'Jomali Pro',
    'homme libre',
    'Zap Télé Officiel',
    'Téléfoot',
    'ELBILAD TV',
    'FlorianOnAir',
    'sofiane adila',
    'Okay.africa',
    'To7Fa Tube',
    'NumidiaTV'
  ].freeze

  def initialize
    @client = Google::Apis::YoutubeV3::YouTubeService.new
    @client.key = ENV['YOUTUBE_API_KEY']
  end

  def trends(country, max_results, page_token = nil)
    @client.list_videos 'snippet', chart: 'mostPopular', region_code: country, max_results: max_results, page_token: page_token
  end
end
