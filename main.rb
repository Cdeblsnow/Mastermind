require "rubocop"

require_relative "lib/game"
require_relative "lib/machine"
require_relative "lib/player"

game = Game.new
player = Player.new
machine = Machine.new
game.list_of_guesses(machine.combination_generator)
generated_code = machine.code_generator

options = {
  "1" => "Player vs Machine",
  "2" => "Machine vs Player",
  "3" => "Quit"
}
loop do
  puts "Welcome, what game mode would you like to play today?"
  options.each { |k, v| puts "#{k} #{v}" }
  puts "Select 1-3"
  choice = gets.chomp

  case choice
  when "1"
    machine.code_generator
    machine.show_code
    12.times do |i|
      puts "You have #{12 - i} turns to guess the code"

      machine.show_colors
      answer = gets.chomp.upcase
      player.get_answer(answer)
      game.current_player_guess(player.player_answer)
      game.comp_code(generated_code)
      game.show
      if game.win? == true
        puts "Congratulations!, you have guessed the code"
        break
      else
        game.feedback_pvsm
        game.show_feedback # try to fuse show feedback and feedback
        game.new_round
      end
    end

  when "2"
    puts "Please enter your secret code"
    puts "Avaible colors: #{machine.show_colors} "
    puts "Remember: do not puts spaces between the letters and only pick four colors"
    secret_code = gets.chomp.upcase
    player.player_made_code(secret_code)
    game.player_created_code(player.player_code)
    game.current_player_guess(machine.first_guess)
    12.times do |i|
      puts "Machine have #{12 - i} turns to guess the code" # it is not working. wasting all the attemps. will have to stop before next itaration and check if list is updating
      machine.show_guess
      machine.show_colors

      if game.win? == true
        puts "Congratulations!, you have guessed the code"
        break
      else
        game.feedback_pvsm
        game.feedback_mvsp
        game.show_feedback_mvsp
        game.new_round
        game.update_list
        machine.machine_new_guess(game.list)

        game.current_player_guess(machine.guess)
        p "machine guess #{machine.guess}"

      end
    end

  when "3"
    break
  end
end

# to do
# it is not doing a new pick in machine.machine_new_guess(game.list)
