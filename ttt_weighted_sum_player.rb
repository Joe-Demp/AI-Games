# frozen_string_literal: true

# A Player that decides on it's next move by evaluating boards with a weighted sum
class TTTWeightedSumPlayer < Player
  def get_move(boards_and_moves)
    scores_and_moves = boards_and_moves.map { |pair| [score(pair[0]), pair[1]] }
    scores_and_moves.max_by { |pair| pair[0] }
  end

  def score(board)
    score = 0
    score += 3 if middle_taken?(board)
    score += rows_and_columns_with_two(board)

    score = Float::INFINITY if board.finished?
    score
  end

  def middle_taken?(board)
    board.symbol_at(Move.new(1, 1)) == @symbol
  end

  def rows_and_columns_with_two(board)
    count = 0
    (0...3).each do |num|
      count +=1 if number_in_column(board, num) == 2
      count +=1 if number_in_row(board, num) == 2
    end
    count
  end

  # @todo reconsider this. Could a Proc help reduce code duplication?
  def number_in_column(board, column)
    return if column > 2

    count = 0
    (0...3).each do |row|
      count += 1 if @symbol == board.symbol_at(Move.new(row, column))
    end
    count
  end

  def number_in_row(board, row)
    return if row > 2

    count = 0
    (0...3).each do |column|
      count += 1 if @symbol == board.symbol_at(Move.new(row, column))
    end
    count
  end
end
