require "colorize"
require_relative "game"

class Player
  attr_accessor :player_answer, :player_code

  def initialize
    @player_code = []
  end

  def get_answer(ans)
    @player_answer = ans.chars
    @player_answer
  end

  def player_made_code(code)
    @player_code = code.chars
  end
end
