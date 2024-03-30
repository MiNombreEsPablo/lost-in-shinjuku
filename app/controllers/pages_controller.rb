# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    @image = 'xelraf0ot18akvqtp3ez'
    @phase = 0
    @story = "You are a foreigner in Shinjuku station, and you're late for your date."
    @options = { '1': 'Start' }
  end
end
