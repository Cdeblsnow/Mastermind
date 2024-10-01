class Game
  attr_accessor :new_pool, :player_guess, :current_code, :list

  def initialize
    @fedback = []
    @machine_feedback = []
    @new_pool = []
  end

  def new_round
    @fedback = []
    @machine_feedback = []
  end

  def list_of_guesses(list)
    @list = list
  end

  def player_created_code(code)
    @current_code = code
  end

  # player guess
  def current_player_guess(ans)
    @player_guess = ans
  end

  # Generated code
  def comp_code(code)
    @current_code = code
  end

  # black if the colors are in the right place, white if the color is in the code but in the wrong place

  def feedback_pvsm
    @current_code.length.times do |x|
      if @current_code[x] == @player_guess[x] # need to re made
        @fedback.push("B")
      elsif @current_code.any?(@player_guess[x])
        @fedback.push("W")
      end
    end
  end

  def feedback_mvsp
    # will reduce the possibe guesses comparing the list against the current guess
    @list.each do |pguess|
      @machine_feedback = []
      @player_guess.length.times do |x|
        if @player_guess[x] == pguess[x]
          @machine_feedback.push("B")
        elsif pguess.include?(@player_guess[x])
          @machine_feedback.push("W")
        end
      end

      @new_pool.push(pguess) if @machine_feedback.sort == @fedback.sort
    end
  end

  def show_feedback
    puts "feedback is #{@fedback.join(' ')}"
  end

  def win?
    return false unless @current_code == @player_guess

    true
  end

  def update_list
    if @new_pool.empty? == true # keep list if new pool empty, else replace list with new pool
      @list
    else
      @list = @new_pool.dup
      @new_pool = []
    end
  end
end
