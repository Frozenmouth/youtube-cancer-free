class WelcomeController < ApplicationController
  def index
    youtube_data_api = YoutubeDataApi.new.client
    @result, @errors = youtube_data_api.list_searches 'snippet', q: 'trends france -cyprien -fortnite -gotaga -gamemixtreize -bodytime -farod -andy -telefoot -konbini -topito -inthepanda -vdbuzz -mickalow -sandrea'
  end
end
