require "TicTacToe/version"
require "Game"

module App
  puts "Hello friend!"
  game = Game.new('Tic Tac Toe')
  puts "This is a game called " + game.title
end
