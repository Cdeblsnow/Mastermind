require "colorize"
require_relative "game"
class Machine
  @@colors = ["R".colorize(:red), "B".colorize(:blue), "Y".colorize(:yellow),
              "G".colorize(:green), "P".colorize(:magenta), "H".colorize(:gray)]
  def self.show_colors
    puts @@colors.join(" ")
  end

  def self.code_generator
    color_code = %w[R B Y G P H].shuffle
    @code = color_code.slice(0, 4)

    Game.comp_code(@code)
  end

  def self.show_code
    puts @code
  end
end
