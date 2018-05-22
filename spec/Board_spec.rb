require 'Board'

RSpec.describe Board, 'add mark' do
  before :each do
    @board = Board.new 3
  end
  context 'player is adding a mark' do
    it 'returns true when parameters given are valid and board array is updated' do
      allow(@board).to receive(:location_is_valid?).and_return(true)
      expect(@board.add_mark(1, 1, 'O')).to be true
      expect(@board.get_value(1, 1)).to eq 'O'
    end
    it 'returns false when parameters given are valid and board array is not updated' do
      allow(@board).to receive(:location_is_valid?).and_return(false)
      expect(@board.add_mark(1, 1, 'O')).to be false
      expect(@board.get_value(1, 1)).to be_falsey
    end
  end
end

RSpec.describe Board, 'add random mark' do
  before :each do
    @board = Board.new 3
  end
  context 'computer is adding a mark' do
    it 'calls add mark 1 time on an empty board' do
      allow(@board).to receive(:get_value).and_return(nil)
      expect(@board).to receive(:add_mark).once
      @board.add_random_mark('X')
    end
    it 'calls add mark 1 time and get_value 2 times on a board with first row left box full' do
      allow(@board).to receive(:get_value).and_return('O', nil)
      expect(@board).to receive(:add_mark).once
      expect(@board).to receive(:get_value).twice
      @board.add_random_mark('X')
    end
  end
end

RSpec.describe Board, 'get value' do
  before :each do
    @board = Board.new 3
  end
  context 'game is retreiving value from board' do
    it 'returns nil for empty box' do
      expect(@board.get_value(0, 0)).to eq nil
    end
    it 'returns X for box marked with X' do
      @board.add_mark(0, 0, 'X')
      expect(@board.get_value(0, 0)).to eq 'X'
    end
    it 'returns O for box marked with O' do
      @board.add_mark(0, 0, 'O')
      expect(@board.get_value(0, 0)).to eq 'O'
    end
  end
end

RSpec.describe Board, 'print the board' do
  context 'game displaying the board on console' do
    it 'calls print 9 times for a 3 by 3 board' do
      @board = Board.new 3
      expect(@board).to receive(:print).exactly(9).times
      @board.print_board
    end
    it 'calls print 16 times for a 4 by 4 board' do
      @board = Board.new 4
      expect(@board).to receive(:print).exactly(16).times
      @board.print_board
    end
  end
end

RSpec.describe Board, 'validate location' do
  before :each do
    @board = Board.new 3
  end
  context 'validating input coordinates' do
    it 'returns false when location is out of bounds' do
      expect(@board.location_is_valid?(4, 4)).to be_falsey
    end
    it 'return false when coordinate given is occupied' do
      allow(@board).to receive(:space_is_free).and_return(false)
      expect(@board.location_is_valid?(1, 1)).to be_falsey
    end
    it 'return false when coordinate is inside bounds but is occupied' do
      allow(@board).to receive(:space_is_free).and_return(false)
      expect(@board.location_is_valid?(1, 1)).to be_falsey
    end
    it 'return true when coordinate is inside bounds and not occupied' do
      allow(@board).to receive(:space_is_free).and_return(true)
      expect(@board.location_is_valid?(1, 1)).to be true
    end
  end
end

RSpec.describe Board, 'out of bounds' do
  before :each do
    @board = Board.new 3
  end
  context 'validating if input is out of bounds' do
    it 'returns true when row is greater than board size' do
      expect(@board.out_of_bounds(4, 2)).to be_truthy
    end
    it 'returns true when column is greater than board size' do
      expect(@board.out_of_bounds(2, 4)).to be_truthy
    end
    it 'returns false when row and column are equal to board size' do
      expect(@board.out_of_bounds(3, 3)).to be_falsey
    end
    it 'returns false when row and column are less than board size' do
      expect(@board.out_of_bounds(1, 1)).to be_falsey
    end
  end
end

RSpec.describe Board, 'space is free' do
  before :each do
    @board = Board.new 3
  end
  context 'validating if input space is already taken' do
    it 'returns true when value in space is nil' do
      allow(@board).to receive(:get_value).and_return(nil)
      expect(@board.space_is_free(2, 2)).to be true
    end
    it 'returns false when value in space is not nil' do
      allow(@board).to receive(:get_value).and_return('X')
      expect(@board.space_is_free(2, 1)).to be false
    end
  end
end

RSpec.describe Board, 'check line values' do
  before :each do
    @board = Board.new 3
  end
  context 'validating if line of @size has matching values ' do
    it 'returns true when all values are equal' do
      allow(@board).to receive(:get_value).and_return(nil, nil, nil)
      expect(@board.values_are_equal?(true)).to be_truthy
    end
    it 'returns nil when at least 1 value is different' do
      allow(@board).to receive(:get_value).and_return('X','O','X')
      expect(@board.values_are_equal?(false, true)).to be_falsey
    end
  end
end

RSpec.describe Board, 'win conditions' do
  before :each do
    @board = Board.new 3
  end
  # Context for Horizontal winning condition
  context 'checking if board has horizontal winning combination' do
    it "returns true when top row are all 'X's" do
      3.times do |i|
        @board.add_mark(0, 0 + i, 'X')
      end
      expect(@board.check_horizontal).to be true
    end
    it "returns false when row has 'X's and 'O's" do
      2.times do |i|
        @board.add_mark(1, 0 + i, 'X')
      end
      @board.add_mark(1, 3, 'O')
      expect(@board.check_horizontal).to be nil
    end
    it 'returns nil when board does not have fully marked rows' do
      2.times do |i|
        @board.add_mark(1, 0 + i, 'X')
      end
      expect(@board.check_horizontal).to be nil
    end
  end
  # Context for Vertical winning condition
  context 'checking if board has vertical winning combination' do
    it "returns true when top column are all 'X's" do
      3.times do |i|
        @board.add_mark(0 + i, 0, 'X')
      end
      expect(@board.check_vertical).to be true
    end
    it "returns false when column has 'X's and 'O's" do
      2.times do |i|
        @board.add_mark(0 + i, 1, 'X')
      end
      @board.add_mark(1, 3, 'O')
      expect(@board.check_vertical).to be nil
    end
    it 'returns nil when board does not have fully marked columns' do
      2.times do |i|
        @board.add_mark(0 + i, 1, 'X')
      end
      expect(@board.check_vertical).to be nil
    end
  end
  # Context for Diagonal winning condition
  context 'checking if board has diagonal winning combination' do
    it "returns true when diagonal are all 'X's" do
      3.times do |i|
        @board.add_mark(0 + i, 0 + i, 'X')
      end
      expect(@board.check_diagonal).to be true
    end
    it "returns false when diagonal has 'X's and 'O's" do
      2.times do |i|
        @board.add_mark(0 + i, 0 + i, 'X')
      end
      @board.add_mark(2, 2, 'O')
      expect(@board.check_diagonal).to be nil
    end
    it 'returns nil when board does not have fully marked diagonal' do
      2.times do |i|
        @board.add_mark(0 + i, 1, 'X')
      end
      expect(@board.check_diagonal).to be nil
    end
  end
  # Context for Inverted Diagonal winning condition
  context 'checking if board has inverted diagonal winning combination' do
    it "returns true when inverted diagonal are all 'X's" do
      3.times do |i|
        @board.add_mark(2 - i, 0 + i, 'X')
      end
      expect(@board.check_diagonal_inverted).to be true
    end
    it "returns false when inverted diagonal has 'X's and 'O's" do
      2.times do |i|
        @board.add_mark(2 - i, 0 + i, 'X')
      end
      @board.add_mark(0, 2, 'O')
      expect(@board.check_diagonal_inverted).to be nil
    end
    it 'returns nil when board does not have fully marked inverted diagonal' do
      2.times do |i|
        @board.add_mark(2 - i, 0 + i, 'X')
      end
      expect(@board.check_diagonal_inverted).to be nil
    end
  end
end
