require "TicTacToe/version"
require "Game"

module App
  puts
  game = Game.new('Tic Tac Toe')
  puts "Welcome! This is a game called " + game.title
  game.play
end
