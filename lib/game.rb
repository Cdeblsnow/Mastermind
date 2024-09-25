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

  def show
    puts "#{@player_guess} human "
    puts "#{@current_code} machine "
  end

  # black if the colors are in the right place, white if the color is in the code but in the wrong place

  def feedback_pvsm
    @current_code.length.times do |x|
      if @current_code[x] == @player_guess[x]
        @fedback.push("B")
      elsif @current_code.any?(@player_guess[x])
        @fedback.push("W")
      end
    end
  end

  def feedback_mvsp
    @list.length.times do |w|
      @machine_feedback = []
      @player_guess.length.times do |x|
        if @player_guess[x] == @list[w][x]
          @machine_feedback.push("B")
        elsif @player_guess.include?(@list[w][x])
          @machine_feedback.push("W")
        end
      end

      @new_pool.push(@list[w]) if @machine_feedback.sort == @fedback.sort
    end
  end

  def show_feedback
    puts @fedback.join(" ")
  end

  def show_feedback_mvsp
    p "the pool length is #{@new_pool.length}"

    puts "machine fedback is #{@machine_feedback.join(' ')} and fedback is #{@fedback.join(' ')}" # chang machine_feedback for feedback. delete method when everything works
  end

  def win?
    return unless @current_code == @player_guess

    true
  end

  def update_list
    return if @new_pool.empty? # keep list if new pool empty, else replace list with new pool

    # if not works try assign a copy of the original instead the variable itself

    @list = @new_pool
    @new_pool = []
  end
end
