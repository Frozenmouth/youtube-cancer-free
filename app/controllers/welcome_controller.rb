# frozen_string_literal: true

class WelcomeController < ApplicationController
  QUERY = <<-STRING
    youtube france -cyprien -fortnite -gotaga -gamemixtreize -bodytime -farod -andy -telefoot -konbini
    -topito -inthepanda -vdbuzz -mickalow -sandrea
  STRING

  def index
    youtube_data_api = YoutubeDataApi.new.client
    @result, @errors = youtube_data_api.list_searches 'snippet', q: QUERY, max_results: '50'
  end
end
