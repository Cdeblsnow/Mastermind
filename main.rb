require "rubocop"

require_relative "lib/game"
require_relative "lib/machine"
require_relative "lib/player"

game = Game.new
player = Player.new
machine = Machine.new
generated_code = machine.code_generator
pool = machine.combination_generator
pool = pool.difference([machine.first_guess])
game.list_of_guesses(pool)

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
    12.times do |i|
      puts "You have #{12 - i} turns to guess the code"

      machine.show_colors
      answer = gets.chomp.upcase
      player.get_answer(answer)
      game.current_player_guess(player.player_answer)
      game.comp_code(generated_code)
      p generated_code
      if game.win? == true
        puts "Congratulations!, you have guessed the code"
        break
      else
        game.feedback_pvsm
        game.show_feedback
        game.new_round
      end
    end

  when "2"
    puts "Please enter your secret code"
    puts "Avaible colors:  "
    puts machine.show_colors
    puts "Remember: do not puts spaces between the letters and only pick four colors"
    secret_code = gets.chomp.upcase
    player.player_made_code(secret_code)
    game.player_created_code(player.player_code)
    game.current_player_guess(machine.first_guess)
    12.times do |i|
      puts "Machine have #{12 - i} turns to guess the code."

      machine.show_colors
      puts ""
      puts " #{'Machine has guessed:'.colorize(:yellow)}"
      machine.show_guess
      puts ""

      if game.win? == true
        puts "#{'Congratulations!'.colorize(:green)},you have guessed the code"
        puts ""
        break
      else
        game.feedback_pvsm
        game.feedback_mvsp
        game.show_feedback
        game.new_round
        game.update_list
        machine.machine_new_guess(game.list)

        game.current_player_guess(machine.guess)

      end
    end

  when "3"
    break
  end
end
