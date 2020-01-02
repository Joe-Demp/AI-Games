require 'test/unit'
require_relative '../tic_tac_toe.rb'
require_relative '../ttt_mini_max_player.rb'
require_relative '../board_game.rb'

# Documentation for TTTMiniMaxPlayerTest
class TTTMiniMaxPlayerTest < Test::Unit::TestCase
  def setup
    @player_x = TTTMiniMaxPlayer.new('X', :x)
    @player_o = TTTMiniMaxPlayer.new('O', :o)
    @game_a = TicTacToe.new(@player_x, @player_o)

    TicTacToe.send(:attr_writer, :state)
  end

  def teardown
    TicTacToe.send(:undef_method, :state=)
  end

  def test_get_move1
    @game_a.state =
      [BoardGame::SPACE, BoardGame::SPACE, BoardGame::SPACE,
       :x, :o, :x,
       :x, :x, :o]

    children = []
    @game_a.each_next_board_and_move(@player_x.symbol) do |board, move|
      children << [board, move]
    end

    assert_equal(Move.new(0, 0), @player_x.get_move(children))
  end

  def test_get_move2
    @game_a.state =
      [:x, BoardGame::SPACE, :x,
       BoardGame::SPACE, :o, :o,
       :x, BoardGame::SPACE, BoardGame::SPACE]

    children = []
    @game_a.each_next_board_and_move(@player_x.symbol) do |board, move|
      children << [board, move]
    end
    assert_equal(Move.new(0, 1), @player_x.get_move(children))

    children = []
    @game_a.each_next_board_and_move(@player_o.symbol) do |board, move|
      children << [board, move]
    end
    assert_equal(Move.new(1, 0), @player_o.get_move(children))
  end

  def test_get_move3
    @game_a.state =
      [BoardGame::SPACE, BoardGame::SPACE, :o,
       :x, :o, :x,
       BoardGame::SPACE, BoardGame::SPACE, BoardGame::SPACE]

    children = []
    @game_a.each_next_board_and_move(@player_x.symbol) do |board, move|
      children << [board, move]
    end
    assert_equal(Move.new(2, 0), @player_x.get_move(children))

    children = []
    @game_a.each_next_board_and_move(@player_o.symbol) do |board, move|
      children << [board, move]
    end
    assert_equal(Move.new(2, 0), @player_o.get_move(children))
  end
end
