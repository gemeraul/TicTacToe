# This is a person who whill the game
class Player
  attr_accessor :name, :mark

  def initialize(name, mark, board)
    @name = name
    @mark = mark
    @board = board
    @invalid_input_error =
      "\nThis is an invalid input! Only use numbers separated by a comma.\n"
  end

  def select_box
    loop do
      row, column = ask_for_coordinates
      next puts @invalid_input_error unless input_valid?(row, column)
      break if @board.add_mark(row - 1, column - 1, @mark)
    end
  end

  def input_valid?(row, column)
    row.is_a?(Integer) && column.is_a?(Integer)
  end

  def ask_for_coordinates
    puts "#{@name}'s turn! On which box would you like to add a #{@mark}?
    \nEnter your coordinates in the form: 'row' , 'column'. Eg: 1,1 for 1st box"
    coordinates = gets.strip.split(',').map(&:to_i)
    coordinates
  end
end
