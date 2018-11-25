class WelcomeController < ApplicationController
  def index
    puts ENV['TEST']
  end
end
