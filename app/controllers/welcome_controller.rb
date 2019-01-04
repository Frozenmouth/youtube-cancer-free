# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    youtube_data_api = YoutubeDataApi.new
    @result, @errors = youtube_data_api.trends('FR', 50)
  end
end
