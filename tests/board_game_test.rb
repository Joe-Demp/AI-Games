# frozen_string_literal: true

require 'test/unit'
require_relative '../board_game.rb'
require_relative '../move.rb'

# Some Documentation about BoardTest
class BoardGameTest < Test::Unit::TestCase
  def setup
    @empty_board = BoardGame.new(nil, nil, 3)
    @board_a = BoardGame.new(nil, nil, 3)
    @board_b = BoardGame.new(nil, nil, 3)
    @board_f = BoardGame.new(nil, nil, 3)
    @board_p = BoardGame.new(nil, nil, 3)

    BoardGame.send(:attr_accessor, :state)

    @board_a.place(:x, Move.new(0, 0))
    @board_a.place(:o, Move.new(1, 1))
    @board_a.place(:o, Move.new(2, 1))

    @board_p.state[0] = :x
    @board_p.state[4] = :o
    @board_p.state[7] = :o

    @board_f.state.fill(:x, 0..8)

    @board_b = @board_f.clone
    @board_b.state[0] = BoardGame::SPACE
    @board_b.state[1] = BoardGame::SPACE
    @board_b.state[2] = BoardGame::SPACE
  end

  def teardown
    BoardGame.send(:undef_method, :state)
  end

  def test_each_next_move
    arrays = next_moves_empty_arrays
    next_moves_empty, correct_moves0 = arrays[0], arrays[1]
    assert_equal(correct_moves0, next_moves_empty)

    arrays = next_moves_half_empty_arrays
    next_moves_half_empty, correct_moves1 = arrays[0], arrays[1]
    assert_equal(correct_moves1, next_moves_half_empty)

    next_moves_full = []
    @board_f.each_next_move { |move| next_moves_full << move }
    assert_equal([], next_moves_full)
  end

  def test_each_next_board_and_move
    next_boards_and_moves = []
    @board_b.each_next_board_and_move(:o) do |board, move|
      next_boards_and_moves << [board, move]
    end

    assert_equal(actual_next_boards_and_moves, next_boards_and_moves)
  end

  def test_place
    assert_equal(:x, @board_a.state[0])
    assert_equal(:o, @board_a.state[4])
    assert_equal(:o, @board_a.state[7])
  end

  def test_finished?
    assert_false(@empty_board.finished?)
    assert_false(@board_a.finished?)
    assert(@board_f.finished?)
  end

  def test_equality
    empty_b = BoardGame.new(nil, nil, 3)
    assert_equal(empty_b, @empty_board)
    assert(@board_a == @board_p)
  end

  def test_clone
    board_a_clone = @board_a.clone
    assert_equal(@board_a, board_a_clone)

    board_a_clone.place(:k, Move.new(0, 1))
    assert_not_equal(@board_a, board_a_clone)
  end

  def test_to_s
    empty_board_string = " _|_ _|_ \n" \
     " _|_ _|_ \n" \
     "  |   |  \n"
    assert_equal(empty_board_string, @empty_board.to_s)

    full_board_string = "x_|_x_|_x\n" \
     "x_|_x_|_x\n" \
     "x | x | x\n"
    assert_equal(full_board_string, @board_f.to_s)
  end

  def test_move_in_bounds?
    # empty square
    assert(@empty_board.send(:move_in_bounds?, Move.new(0, 0)))
    assert(@empty_board.send(:move_in_bounds?, Move.new(2, 2)))

    # full square
    assert_false(@board_a.send(:move_in_bounds?, Move.new(0, 0)))

    # square out of bounds
    assert_false(@board_a.send(:move_in_bounds?, Move.new(3, 3)))
  end

  def test_symbol_at
    assert_equal(:x, @board_a.send(:symbol_at, Move.new(0, 0)))
    assert_equal(' '.to_sym, @board_a.send(:symbol_at, Move.new(0, 1)))
    assert_equal(:o, @board_a.send(:symbol_at, Move.new(1, 1)))
    assert_equal(:o, @board_a.send(:symbol_at, Move.new(2, 1)))
  end

  private

  def next_moves_empty_arrays
    next_moves_empty = []
    @empty_board.each_next_move { |move| next_moves_empty << move }
    correct_moves0 = [
      Move.new(0, 0), Move.new(0, 1), Move.new(0, 2),
      Move.new(1, 0), Move.new(1, 1), Move.new(1, 2),
      Move.new(2, 0), Move.new(2, 1), Move.new(2, 2)
    ]
    [next_moves_empty, correct_moves0]
  end

  def next_moves_half_empty_arrays
    next_moves_half_empty = []
    @board_a.each_next_move { |move| next_moves_half_empty << move }
    correct_moves1 = [
      Move.new(0, 1), Move.new(0, 2),
      Move.new(1, 0), Move.new(1, 2),
      Move.new(2, 0), Move.new(2, 2)
    ]
    [next_moves_half_empty, correct_moves1]
  end

  def actual_next_boards
    space = BoardGame::SPACE
    states = [
      [:o, space, space, :x, :x, :x, :x, :x, :x],
      [space, :o, space, :x, :x, :x, :x, :x, :x],
      [space, space, :o, :x, :x, :x, :x, :x, :x]
    ]

    boards = []
    3.times do |time|
      boards << BoardGame.new(nil, nil, 3)
      boards.last.state = states[time]
    end

    boards
  end

  def actual_next_boards_and_moves
    space = BoardGame::SPACE
    states = [
      [:o, space, space, :x, :x, :x, :x, :x, :x],
      [space, :o, space, :x, :x, :x, :x, :x, :x],
      [space, space, :o, :x, :x, :x, :x, :x, :x]
    ]

    boards = []
    3.times do |time|
      boards << [BoardGame.new(nil, nil, 3), Move.new(0, time)]
      boards.last[0].state = states[time]
    end

    boards
  end
end
