# frozen_string_literal: true

require_relative 'player.rb'

# Documentation about TTTMiniMaxPlayer
class TTTMiniMaxPlayer < Player
  # Calls a method that implements the MiniMax algorithm
  # takes in the second row of the MiniMax tree
  def get_move(boards_and_moves)
    @opp_sym = boards_and_moves[0][0].opposing_symbol(@symbol)
    minimax_get_move(boards_and_moves)[1]
  end

  def minimax_get_move(boards, maximize = true)
    # Takes arrays of [board, move] pairs
    #   generates [score, move] pairs
    #   and returns the pair with 'the best' score
    scored_moves = boards.map { |board| score(board, maximize) }
    if maximize
      scored_moves.max_by { |pair| pair[0] }
    else
      scored_moves.min_by { |pair| pair[0] }
    end
  end

  def score(pair, maximize)
    if pair[0].finished?
      [evaluate(pair[0]), pair[1]]
    else # call minimax on the board's children
      next_symbol = maximize ? @opp_sym : @symbol
      children = []
      pair[0].each_next_board_and_move(next_symbol) do |board, move|
        children << [board, move]
      end
      # gets a [score, move] pair, keeps the score and returns the move
      [minimax_get_move(children, !maximize)[0], pair[1]]
    end
  end

  def evaluate(board)
    return 0 unless board.finished?

    board.winning_symbol == @symbol ? 1 : -1
  end
end
