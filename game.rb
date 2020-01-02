# frozen_string_literal: true

# Documentation about Game
class Game
  def initialize(player1, player2)
    @p1 = player1
    @p2 = player2
    @p1s_turn = true
  end

  def play
    until finished?
      play_next_move
      yield
    end
  end

  def play_next_move
    current_player = @p1s_turn ? @p1 : @p2
    boards_and_moves = each_next_board_and_move(current_player.symbol)

    move = current_player.get_move(boards_and_moves)
    place(current_player.symbol, move) unless move.nil?
    @p1s_turn = !@p1s_turn
  end

  def winners_message
    sym = winning_symbol.nil? ? :nil : winning_symbol # because you can't call to_sym on nil
    winner = @p1.symbol == sym ? @p1 : @p2

    "(#{sym}) #{winner.name} has won!"
  end
end
