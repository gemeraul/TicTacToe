require 'Game'
require 'Player'

RSpec.describe Game, 'flip coin' do
  before :each do
    @game = Game.new 'TicTacToe'
  end
  context 'flipping a coin' do
    it 'returns a 0 or 1 randomly' do
      expect(@game.flip_coin).to eq(0).or eq(1)
    end
  end
end
