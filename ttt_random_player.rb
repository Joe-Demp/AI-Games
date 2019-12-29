class TTTRandomPlayer < Player
  def get_move(boards_and_moves)
    len = boards_and_moves.length
    index = Random.new.rand(len)
    boards_and_moves[index][1]
  end
end