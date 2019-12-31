# frozen_string_literal: true

require_relative 'player.rb'

# Documentation about TTTMiniMaxPlayer
class TTTMiniMaxPlayer < Player
  # Calls a method that implements the MiniMax algorithm
  # takes in the second row of the MiniMax tree
  def get_move(boards_and_moves)
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
      pair[0] = evaluate(pair[0])
      pair
    else
      minimax_get_move(pair, !maximize)
    end
  end

  def evaluate(board)
    return 0 unless board.finished?

    winning_symbol == @symbol ? 1 : -1
  end
end
