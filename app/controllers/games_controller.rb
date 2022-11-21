require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def new
    @letters = []
    10.times { @letters << ('A'..'Z').to_a.sample }
  end

  def score
    console
    @word = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    word_serialized = URI.open(url).read
    result = JSON.parse(word_serialized)
    if result["found"] == true
      @result = "Congratulations! #{@word} is a valid English word!"
    else
      @result = "Sorry but #{@word} does not seem to be a valid English word..."
    end
  end
end
