require "colorize"
require_relative "game"

class Player
  def initialize
    @player_code = []
  end

  def self.get_answer(ans)
    @player_answer = ans.chars
    puts @player_answer
    Game.human_answer(@player_answer)
  end

  def player_code(code)
    @player_code = code.chars
    Game.comp_code(@player_code)
    Game.player_code(@player_code)
  end

  protected

  attr_accessor :player_answer
end
