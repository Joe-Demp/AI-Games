# frozen_string_literal: true

require_relative 'board_game.rb'
require_relative 'move.rb'

# Some Documentation about TicTacToe
class TicTacToe < BoardGame
  def initialize(player1, player2)
    super(player1, player2, 3)
  end

  def finished?
    !winning_symbol.nil? || super
  end

  def winning_symbol
    winning_row || winning_column || winning_diagonal
  end

  def clone
    other = TicTacToe.new(@p1, @p2)
    other.state = @state.clone
    other
  end

  private

  def winning_row
    sym = winning_positions([0, 1, 2])
    sym ||= winning_positions([3, 4, 5])
    sym ||= winning_positions([6, 7, 8])
    sym unless sym == SPACE
  end

  def winning_column
    sym = winning_positions([0, 3, 6])
    sym ||= winning_positions([1, 4, 7])
    sym ||= winning_positions([2, 5, 8])
    sym unless sym == SPACE
  end

  def winning_diagonal
    sym = winning_positions([0, 4, 8])
    sym ||= winning_positions([2, 4, 6])
    sym unless sym == SPACE
  end

  # @todo consider using reduce here
  def winning_positions(positions)
    won = true
    sym = @state[positions[0]]
    positions.each { |pos| won &&= sym == @state[pos] }
    sym if won unless sym == BoardGame::SPACE
  end
end
