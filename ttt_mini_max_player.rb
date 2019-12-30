# frozen_string_literal: true

require_relative 'player.rb'

# Documentation about TTTMiniMaxPlayer
class TTTMiniMaxPlayer < Player
  # Calls a method that implements the MiniMax algorithm
  # takes in the second row of the MiniMax tree
  def get_move(boards_and_moves); end

  def minimax_get_move(boards, maximize = true)
    # if maximize, find the max and return it
    #  the max being:
    #   the evaluation of the board if board.finished?
    #   or the minimax of the board's children
    #
    # else, find the min => could use a lambda
    board_comparison = lambda do |board1, board2|

    end

    # @todo tidy this up
    # should always return a score of the board passed to it
    #
    board_evaluate = lambda do |board|
      if board.finished?
        evaluate(board)
      else
        symbol = board.opposing_symbol(@symbol)
        board_children = []
        board.each_next_board_and_move(symbol) { |board, move| board_children << [board, move] }
        minimax_get_move(board_children, !maximize)
        # fix the return value of this method
      end
    end

    if maximize
      boards.max # send lambda here
    else
      boards.min # send lambda here
    end
  end

  def evaluate(board)
    return 0 unless board.finished?

    winning_symbol == @symbol ? 1 : -1
  end
end
