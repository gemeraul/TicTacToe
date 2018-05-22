require 'TicTacToe/version'
require 'Game'

module App
  puts
  puts 'Welcome! This is our Tic Tac Toe Simulator!'
  puts
  game = Game.new('Tic Tac Toe')
  game.play
end
