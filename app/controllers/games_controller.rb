class GamesController < ApplicationController
  def new
    grid_size = rand(5..15)
    characters = ('a'..'z').to_a
    @letters = []
    until grid_size.zero?
      @letters << characters.sample
      grid_size -= 1
    end
  end

  def score
    @word = params[:word].split('')
    @letters = params[:letters].split('')
    # = @letters.sort
    validate = @word.all? { |item| @letters.count(item) >= @word.count(item) }
    @result =
      if validate
        "Congratulations! #{@word} is a valid English word"
      else
        "Sorry #{@word.join('').upcase} can not be built out of #{@letters.join('').upcase}"
      end
  end
end
