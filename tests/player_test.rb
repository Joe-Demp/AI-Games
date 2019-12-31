# frozen_string_literal: true
require 'test/unit'
require_relative '../player.rb'

class PlayerTest < Test::Unit::TestCase
  def setup
    @player_a = Player.new('Joseph', :y)
    @player_b = Player.new('Ricky', :q)
  end

  def test_initialize
    assert_equal('Joseph', @player_a.name)
    assert_equal(:y, @player_a.symbol)
    assert_equal('Ricky', @player_b.name)
    assert_equal(:q, @player_b.symbol)
  end
end