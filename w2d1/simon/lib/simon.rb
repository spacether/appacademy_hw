class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    goal = show_sequence
    given = require_sequence
    if given == goal
      round_success_message
    else
      game_over_message
    end
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    @seq.dup
  end

  def require_sequence
    gets.chomp
  end

  def add_random_color
    @seq << COLORS.sample
    @seq.last
  end

  def round_success_message
    puts "You won the round!"
  end

  def game_over_message
    puts "Game over."
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
