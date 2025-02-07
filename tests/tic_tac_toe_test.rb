# frozen_string_literal: true

require 'test/unit'
require_relative '../tic_tac_toe.rb'
require_relative '../board_game.rb'

# Documentation for TicTacToeTest
class TicTacToeTest < Test::Unit::TestCase
  def setup
    @empty_board = TicTacToe.new(nil, nil)
    @board_f = TicTacToe.new(nil, nil)
    TicTacToe.send(:attr_accessor, :state, :side)

    @board_f.state.fill(:x, 0..8)

    # setup wins
    setup_diagonal_wins
    setup_vertical_wins
    setup_horizontal_wins
  end

  def teardown
    TicTacToe.send(:undef_method, :state, :side, :state=, :side=)
  end

  def test_initialize
    assert_equal(3, @empty_board.side)
  end

  def test_finished?
    assert_true(@board_f.finished?)
    assert_true(@board_w.finished?)
    assert_true(@board_z.finished?)
    assert_true(@board_b.finished?)

    assert_false(@empty_board.finished?)
  end

  def test_winning_symbol
    assert_equal(:x, @board_f.winning_symbol)
    assert_equal(:d, @board_w.winning_symbol)
    assert_equal(:v, @board_z.winning_symbol)
    assert_equal(:h, @board_b.winning_symbol)

    assert_nil(@empty_board.winning_symbol)
  end

  def test_winning_diagonal
    assert_equal(:d, @board_v.send(:winning_diagonal))
    assert_equal(:d, @board_w.send(:winning_diagonal))
  end

  def test_winning_column
    assert_equal(:v, @board_x.send(:winning_column))
    assert_equal(:v, @board_y.send(:winning_column))
    assert_equal(:v, @board_z.send(:winning_column))
  end

  def test_winning_row
    assert_equal(:h, @board_a.send(:winning_row))
    assert_equal(:h, @board_b.send(:winning_row))
    assert_equal(:h, @board_c.send(:winning_row))
  end

  private

  def setup_diagonal_wins
    @board_v = TicTacToe.new(nil, nil)
    @board_w = TicTacToe.new(nil, nil)

    @board_v.state = [BoardGame::SPACE, BoardGame::SPACE, :d,
                      BoardGame::SPACE, :d, BoardGame::SPACE,
                      :d, BoardGame::SPACE, BoardGame::SPACE]
    @board_w.state = [:d, BoardGame::SPACE, BoardGame::SPACE,
                      BoardGame::SPACE, :d, BoardGame::SPACE,
                      BoardGame::SPACE, BoardGame::SPACE, :d]
  end

  def setup_vertical_wins
    @board_x = TicTacToe.new(nil, nil)
    @board_y = TicTacToe.new(nil, nil)
    @board_z = TicTacToe.new(nil, nil)

    @board_x.state = [:v, BoardGame::SPACE, BoardGame::SPACE,
                      :v, BoardGame::SPACE, BoardGame::SPACE,
                      :v, BoardGame::SPACE, BoardGame::SPACE]
    @board_y.state = [BoardGame::SPACE, :v, BoardGame::SPACE,
                      BoardGame::SPACE, :v, BoardGame::SPACE,
                      BoardGame::SPACE, :v, BoardGame::SPACE]
    @board_z.state = [BoardGame::SPACE, BoardGame::SPACE, :v,
                      BoardGame::SPACE, BoardGame::SPACE, :v,
                      BoardGame::SPACE, BoardGame::SPACE, :v]
  end

  def setup_horizontal_wins
    @board_a = TicTacToe.new(nil, nil)
    @board_b = TicTacToe.new(nil, nil)
    @board_c = TicTacToe.new(nil, nil)

    # @todo fix this, States should be filled with SPACEs
    @board_a.state = [:h, :h, :h,
                      BoardGame::SPACE, BoardGame::SPACE, BoardGame::SPACE,
                      BoardGame::SPACE, BoardGame::SPACE, BoardGame::SPACE]
    @board_b.state = [BoardGame::SPACE, BoardGame::SPACE, BoardGame::SPACE,
                      :h, :h, :h,
                      BoardGame::SPACE, BoardGame::SPACE, BoardGame::SPACE]
    @board_c.state = [BoardGame::SPACE, BoardGame::SPACE, BoardGame::SPACE,
                      BoardGame::SPACE, BoardGame::SPACE, BoardGame::SPACE,
                      :h, :h, :h]
  end
end
