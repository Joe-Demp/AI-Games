# frozen_string_literal: true

require_relative 'tic_tac_toe.rb'
require_relative 'ttt_random_player.rb'
require_relative 'ttt_mini_max_player.rb'
require_relative 'ttt_weighted_sum_player.rb'

# game = TicTacToe.new(
#   TTTMiniMaxPlayer.new('Joseph', :x),
#   TTTRandomPlayer.new('Catherine', :o)
# )

game = TicTacToe.new(
  TTTMiniMaxPlayer.new('Joseph', :x),
  TTTWeightedSumPlayer.new('Catherine', :o)
)

game.play { puts game.to_s + "\n" }
puts game.winners_message
