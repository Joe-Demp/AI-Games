# frozen_string_literal: true

require_relative 'board_game.rb'
require_relative 'move.rb'

# Some Documentation about TicTacToe
class TicTacToe < BoardGame
  def initialize
    super(3)
  end

  def finished?
    !winning_symbol.nil? || super
  end

  def winning_symbol
    winning_row || winning_column || winning_diagonal
  end

  # def to_s
  #   "#{@state[0]}_|_#{@state[1]}_|_#{@state[2]}\n" \
  #   "#{@state[3]}_|_#{@state[4]}_|_#{@state[5]}\n" \
  #   "#{@state[6]} | #{@state[7]} | #{@state[8]}"
  # end

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

  def winning_positions(positions)
    won = true
    sym = @state[positions[0]]
    positions.each { |pos| won &&= sym == @state[pos] }
    sym if won
  end
end
