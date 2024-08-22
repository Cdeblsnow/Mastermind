require "rubocop"
require_relative "lib/game"
require_relative "lib/machine"
require_relative "lib/player"

12.times do |i|
  puts "You have #{12 - i} turns to guess the code"
  Machine.show_colors
  answer = gets.chomp
  Player.get_answer(answer)
end
