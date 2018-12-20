# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    youtube_data_api = YoutubeDataApi.new.client
    @result, @errors = youtube_data_api.list_videos 'snippet', chart: 'mostPopular', region_code: 'FR', max_results: 50
  end

  def login
    @current_user = current_user
  end  
end
