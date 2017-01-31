class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    indices = (0..5).to_a + (7..12).to_a
    indices.each { |i| @cups[i] = [:stone] * 4 }
  end

  def valid_move?(start_pos)
    valid_pos = start_pos.between?(1, 12)
    raise "Invalid starting cup" unless valid_pos
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos].dup
    @cups[start_pos] = []
    ind = (start_pos + 1) % @cups.length
    badind = (current_player_name == @name1 ? 13 : 6)
    while true
      @cups[ind] << stones.shift if ind != badind
      break if stones.empty?
      ind = (ind + 1) % @cups.length
    end
    render
    next_turn(ind, current_player_name)
  end

  def next_turn(ind, current_player_name)
    home = (current_player_name == @name1 ? 6 : 13)
    return :prompt if ind == home
    return :switch if @cups[ind].length == 1
    ind
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    left_sum = @cups[0..5].reduce(0) { |acc, cup| acc + cup.length }
    right_sum = @cups[7..12].reduce(0) { |acc, cup| acc + cup.length }
    left_sum.zero? || right_sum.zero?
  end

  def winner
    mode = @cups[6] <=> @cups[13]
    case mode
    when 0
      return :draw
    when -1
      return @name2
    when 1
      return @name1
    end
  end
end
