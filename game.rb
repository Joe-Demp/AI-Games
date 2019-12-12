require_relative 'board.rb'

class Game
  attr_reader :p1s_turn

  def initialize(player_1, player_2)
    @p1 = player_1
    @p2 = player_2
    @p1s_turn = true
    @state = GameState.new
  end

  def play_next_move

  end

  def finished?
    @state.finished?
  end

  def to_s
    @state.to_s
  end
end