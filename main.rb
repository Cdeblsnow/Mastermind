require "rubocop"

require_relative "lib/game"
require_relative "lib/machine"
require_relative "lib/player"

game = Game.new
player = Player.new
machine = Machine.new
Machine.combination_generator

options = {
      "1" => "Player vs Machine",
      "2" => "Machine vs Player",
      "3" => "Quit"
    }
loop do
  puts "Welcome, what game mode would you like to play today?"
  choice = 0
  options.each { |k, v| puts "#{k} #{v}" }
  puts "Select 1-3"
  choice = gets.chomp

  case choice
  when "1"
    Machine.code_generator
    Machine.show_code
    12.times do |i|
      puts "You have #{12 - i} turns to guess the code"

      Machine.show_colors
      answer = gets.chomp.upcase
      Player.get_answer(answer)
      Game.show
      if Game.win? == true
        puts "Congratulations!, you have guessed the code"
        break
      else
        Game.show_feedback
        Game.new_round
      end
    end

  when "2"
    puts "Please enter your secret code"
    puts "Avaible colors: #{Machine.show_colors} "
    puts "Remember: do not puts spaces between the letters and only use four colors"
    secret_code = gets.chomp.upcase
    player.player_code(secret_code)
    machine.machine_first_guess
    12.times do |i|
      puts "Machine have #{12 - i} turns to guess the code" #it is not working. wasting all the attemps. will have to stop before next itaration and check if list is updating
      machine.show_guess
      Machine.show_colors
      
      if Game.win? == true
        puts "Congratulations!, you have guessed the code"
        break
      else
        Game.show_feedback_mvsp
        Game.new_round
        game.update_list
        machine.new_guess
       
      end
    end
  end
end
