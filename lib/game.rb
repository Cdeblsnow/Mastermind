class Game
  @@fedback = []
  @@machine_feedback = []
  @@new_pool = []
  attr_accessor :new_pool
  def initialize #el problema es que esto pertenece a la clase que cree en main, no a la clase como tal
    
    
  end

  def self.new_round
    @@fedback = []
    @@machine_feedback = []
    
  end

  def self.player_code(code)
    @human_code = code
  end

  # player guess
  def self.human_answer(ans)
    @human_ans = ans
  end

  # Generated code
  def self.comp_code(code)
    @computer_code = code
  end

  def self.show
    puts "#{@human_ans} human "
    puts @computer_code
  end

  # black if the colors are in the right place, white if the color is in the code but in the wrong place
 
  def self.feedback_pvsm
    @computer_code.length.times do |x|
      if @computer_code[x] == @human_ans[x]
        @@fedback.push("B")
      elsif @computer_code.any?(@human_ans[x])
        @@fedback.push("W")
      end
    end
  end

  def self.feedback_mvsp
      @list.length.times do |w|
        @@machine_feedback = []
      @human_ans.length.times do |x|
        if  @human_ans[x] == @list[w][x]
          @@machine_feedback.push("B")
        elsif  @human_ans.include?(@list[w][x])
          @@machine_feedback.push("W")
        end
      end
      
       @@new_pool.push(@list[w]) if @@machine_feedback.sort == @@fedback.sort
    end
  end

  def self.show_feedback
    Game.feedback_pvsm

    puts @@fedback.join(" ")
  end

  def self.show_feedback_mvsp
    Game.feedback_mvsp
    p @@new_pool.length

    puts @@machine_feedback.join(" ")
  end

  def self.win? #change computer por secret code 
    return unless @computer_code == @human_ans

    true
  end

  
#necesito llamar Game.list al menos una vez
  def self.list_of_guesses(list)
    @list = list
  end

  def update_list
     unless @@new_pool.empty? 
      @list = @@new_pool
      @@new_pool = []
     end
     Machine.machine_new_guess(@list)
  end
end
