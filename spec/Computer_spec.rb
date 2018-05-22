require 'Computer'
require 'Board'

RSpec.describe Computer, 'select box' do
  before :each do
    @board = Board.new 3
    @computer = Computer.new('TestingComputer', 'O', @board)
    allow(@board).to receive(:add_mark).and_return(true)
  end
  context "computer's turn to mark a box'" do
    it 'calls add_random_mark on board object' do
      expect(@board).to receive(:add_random_mark)
      @computer.select_box
    end
  end
end
