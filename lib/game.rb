class Game
  @@fedback = []

  def self.new_round
    @@fedback = []
  end

  # player guess
  def self.human_answer(ans)
    @human_ans = ans
  end

  # computer generated code
  def self.comp_code(code)
    @computer_code = code
  end

  def self.show
    puts "#{@human_ans} human "
    puts @computer_code
  end

  # black if the colors are in the right place, white if the color is in the code but in the wrong place

  def self.feedback
    @computer_code.length.times do |x|
      if @computer_code[x] == @human_ans[x]
        @@fedback.push("B")
      elsif @computer_code.any?(@human_ans[x])
        @@fedback.push("W")
      end
    end
  end

  def self.show_feedback
    Game.feedback

    puts @@fedback.join(" ")
  end

  def self.win?
    return unless @computer_code == @human_ans

    true
  end
end
