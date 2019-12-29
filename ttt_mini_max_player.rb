# frozen_string_literal: true

require_relative 'player.rb'

# Documentation about TTTMiniMaxPlayer
class TTTMiniMaxPlayer < Player
  # Calls a method that implements the MiniMax algorithm
  # takes in the second row of the MiniMax tree
  def get_move(boards_and_moves); end

  def minimax_get_move(boards, maximize=true); end

  def evaluate(board)
    return 0 unless board.finished?

    winning_symbol == @symbol ? 1 : -1
  end
end
