require "colorize"
require_relative "game"
class Machine
  @@colors = ["R".colorize(:red), "B".colorize(:blue), "Y".colorize(:yellow),
              "G".colorize(:green), "P".colorize(:magenta), "G".colorize(:gray)]
  def self.show_colors
    puts @@colors.join(" ")
  end

  def self.code_generator
    color_code = @@colors.shuffle
    @code = color_code
    Game.comp_code(@code)
  end

  def show_code
    @code
  end
end
