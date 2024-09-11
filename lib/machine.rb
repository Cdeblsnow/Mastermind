require "colorize"
require_relative "game"
class Machine

  @@guess = []

  @@colors = ["R".colorize(:red), "B".colorize(:blue), "Y".colorize(:yellow),
              "G".colorize(:green), "P".colorize(:magenta), "H".colorize(:gray)]
  def self.show_colors
    puts @@colors.join(" ")
  end

  
  # Make the secret code in Player vs Machine mode and the first guess
  # for Machine vs Player mode
  def self.code_generator
    color_code = %w[R B Y G P H].shuffle
    @code = color_code.slice(0, 4)

    Game.comp_code(@code)
  end

  def self.show_code
    puts @code
  end

  def self.combination_generator
    pool = %w[R B Y G P H]
    @possible_guessees = pool.repeated_permutation(4).to_a
    Game.list_of_guesses(@possible_guessees)
    p @possible_guessees.length
  end

  def machine_first_guess
    @@guess = %w[R R B B]
    Game.human_answer(@@guess)
  end

  def self.machine_new_guess(list)
     @@guess = []
     @@guess = list[0]
    p list[0]
  end

  def new_guess 
    Game.human_answer( @@guess)
    p "new guess #{ @@guess}"
  end
  def show_guess
    p @guess
  end
end
