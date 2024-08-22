require "colorize"
require_relative "game"

class Player
  def self.get_answer(ans)
    @player_answer = ans.chars
    Game.human_answer(@player_answer)
  end

  protected

  attr_accessor :player_answer
end
