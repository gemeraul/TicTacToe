require 'TicTacToe/version'
require 'Game'

# This is the module that starts everything up
module App
  puts
  puts 'Welcome! This is our Tic Tac Toe Simulator!'
  puts
  game = Game.new('Tic Tac Toe')
  game.play
end
