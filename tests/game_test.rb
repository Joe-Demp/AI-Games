# frozen_string_literal: true

require 'test/unit'
require_relative '../game.rb'
require_relative '../player.rb'

# Class to test class Game
class GameTest < Test::Unit::TestCase
  def setup
    @game = Game.new(Player.new('Joseph', :x), Player.new('Ronald', :y))

    Game.send(:attr_reader, :p1, :p2, :p1s_turn)
  end

  def teardown
    Game.send(:undef_method, :p1, :p2, :p1s_turn)
  end

  def test_initialize
    assert_equal('Joseph', @game.p1.name)
    assert_equal(:x, @game.p1.symbol)
    assert_true(@game.p1s_turn)
  end
end
