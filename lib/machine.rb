require "colorize"
require_relative "game"

class Machine
  attr_accessor :code, :guess, :first_guess

  def initialize
    @guess = %w[R R B B]
    @first_guess = %w[R R B B]
    @code_pool = %w[R B Y G P H]
    @colors = ["R".colorize(:red), "B".colorize(:blue), "Y".colorize(:yellow),
               "G".colorize(:green), "P".colorize(:magenta), "H".colorize(:gray)]
    @code = []
    @pool_of_guesses = []
  end

  def show_colors
    puts @colors.join(" ")
  end

  # Make the secret code in Player vs Machine mode and the first guess
  # for Machine vs Player mode
  def code_generator
    color_code = @code_pool.shuffle
    @code = color_code.slice(0, 4)
  end

  def combination_generator
    @pool_of_guesses = @code_pool.repeated_permutation(4).to_a
    @pool_of_guesses
  end

  def machine_new_guess(list)
    @guess = []
    @guess = list.shift
  end

  def show_guess
    p @guess
  end
end
