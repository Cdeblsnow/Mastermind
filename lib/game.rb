class Game
  @@fedback = []

  def self.new_round
    @@fedback = []
  end

  def self.human_answer(ans)
    @human_ans = ans
  end

  def self.comp_code(code)
    @computer_code = code
  end

  def self.show
    puts "#{@human_ans} human "
    puts @computer_code
  end

  # black if the colors are in the right place, white if the color is in the code but in the wrong place
  def self.black_fedback
    @human_ans.each_with_index do |arr1, i1|
      @computer_code.each_with_index do |arr2, i2|
        @@fedback.push("B".colorize(:black)) if arr1 == arr2 && i1 == i2
      end
    end
  end

  def self.white_fedback
    @human_ans.each_with_index do |arr1, i1|
      @computer_code.each_with_index do |arr2, i2|
        @@fedback.push("W".colorize(:white)) if arr1 == arr2 && i1 != i2
      end
    end
  end

  def self.show_fedback
    Game.black_fedback
    Game.white_fedback
    puts @@fedback.join(" ")
  end

  def self.win?
    return unless @computer_code == @human_ans

    true
  end
end
