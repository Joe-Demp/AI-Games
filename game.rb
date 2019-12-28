class Game
  attr_reader :p1s_turn

  def initialize(player_1, player_2)
    @p1 = player_1
    @p2 = player_2
    @p1s_turn = true
  end

  def play
    play_next_move until finished?

    winners_message
  end

  def play_next_move
    # Get moves
    # pass them to player and get optimal move
    # apply the move
    # go to the next move
  end

  def winners_message
    sym = winning_symbol
    winner = @p1.symbol == sym ? @p1 : @p2

    "(#{sym}) #{winner.name} has won!"
  end
end