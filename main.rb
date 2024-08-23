require "rubocop"
require_relative "lib/game"
require_relative "lib/machine"
require_relative "lib/player"

Machine.code_generator
Machine.show_code
12.times do |i|
  puts "You have #{12 - i} turns to guess the code"
  Machine.show_colors
  answer = gets.chomp.upcase
  Player.get_answer(answer)
  Game.show
  if Game.win? == true
    puts "COngratulations!, you have guessed the code"
    break
  else
    Game.show_fedback
    Game.new_round
  end
end
