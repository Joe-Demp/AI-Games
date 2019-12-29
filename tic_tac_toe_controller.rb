require_relative 'tic_tac_toe.rb'
require_relative 'ttt_random_player.rb'

game = TicTacToe.new(
  TTTRandomPlayer.new('Joseph', :x),
  TTTRandomPlayer.new('Catherine', :o)
                    )

game.play { puts game.to_s + "\n" }
puts game.winners_message
