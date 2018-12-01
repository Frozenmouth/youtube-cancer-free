class WelcomeController < ApplicationController
  def index
    youtube_data_api = YoutubeDataApi.new.client
    @result, @errors = youtube_data_api.list_searches 'snippet', q: 'gotaga'
  end
end
