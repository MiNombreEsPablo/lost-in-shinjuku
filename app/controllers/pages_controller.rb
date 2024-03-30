# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    @image = 'lzmoyshjcs8jlimoxxab'
    @phase = 0
    @story = "You are a foreigner in Shinjuku station, and you're late for your date."
    @options = { '1': 'Start' }
  end
end
