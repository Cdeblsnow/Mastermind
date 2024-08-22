class Game
  @@feddback = []
  def self.human_answer(ans)
    @human_ans = ans
  end

  def self.comp_code(code)
    @computer_code = code
  end

  def black_fedback
    4.times do |i|
      @@feddback.puhs("B".colorize(:black)) if @human_ans[i] == @comp_code[i]
    end
  end

  def white_fedback
    @human_ans.each_with_index do |arr1, i1|
      @comp_code.each_with_index do |arr2, i2|
        @@feddback.puhs("W".colorize(:white)) if arr1 == arr2 && i1 != i2
      end
    end
  end
end
