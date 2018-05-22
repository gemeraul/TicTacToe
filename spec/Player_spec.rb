require 'Player'
require 'Board'

RSpec.describe Player, 'input' do
  before :each do
    @board = Board.new 3
    @player = Player.new('TestingPlayer', 'X', @board)
  end
  context 'user has entered coordinates' do
    it 'returns true when both are numbers' do
      expect(@player.input_valid?(1, 1)).to be true
    end
    it 'returns false when row is not a number' do
      expect(@player.input_valid?('NaN', 1)).to be false
    end
    it 'returns false when column is not a number' do
      expect(@player.input_valid?(1, 'NaN')).to be false
    end
  end
end

RSpec.describe Player, 'select box' do
  before :each do
    @board = Board.new 3
    @player = Player.new('TestingPlayer', 'X', @board)
    allow(@player).to receive(:ask_for_coordinates).and_return([1, 1])
    allow(@board).to receive(:add_mark).and_return(true)
  end
  context 'asking user to select box' do
    it 'calls add_mark on board object' do
      expect(@board).to receive(:add_mark)
      @player.select_box
    end
  end
  context 'asking user to select box' do
    it 'calls add_mark n times until add_mark returns true' do
      allow(@board).to receive(:add_mark).and_return(false, true)
      expect(@board).to receive(:add_mark).twice
      @player.select_box
    end
  end
end

RSpec.describe Player, 'ask for coordinates' do
  before :each do
    @board = Board.new 3
    @player = Player.new('TestingPlayer', 'X', @board)
    allow(@player).to receive(:gets).and_return('1,1')
  end
  context 'asking for user input' do
    it 'returns array of coordinates' do
      expect(@player.ask_for_coordinates).to eq([1, 1])
    end
  end
end
