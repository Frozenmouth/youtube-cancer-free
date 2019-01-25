# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def index 
    cookies[:countries]
    @countries = countries.all
  end
end
