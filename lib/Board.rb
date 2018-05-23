# This is a matrix that will have the marks
class Board
  def initialize(size)
    @size = size
    @board = Array.new(size) { Array.new(size) }
  end

  def add_mark(row, column, mark)
    if location_is_valid?(row, column)
      @board[row][column] = mark
      @row = row
      @column = column
      @mark = mark
      true
    else
      false
    end
  end

  def add_random_mark(mark)
    @stop = false
    @size.times do |r|
      @size.times do |c|
        next unless get_value(r, c).nil?
        add_mark(r, c, mark)
        @stop = true
        break
      end
      break if @stop
    end
  end

  def get_value(row, column)
    @board[row][column]
  end

  def print_board
    puts
    @board.each do |row|
      row.each do |cell|
        cell.nil? ? print(' - ') : print(' ' + cell.to_s + ' ')
      end
      puts
    end
    puts
  end

  def location_is_valid?(row, column)
    if out_of_bounds(row, column)
      puts "\nThe values selected are out of bounds! Lets try again...\n"
      false
    elsif !space_is_free(row, column)
      puts "\nThis space has already been marked! Lets try again...\n"
      false
    else
      true
    end
  end

  def out_of_bounds(row, column)
    return true if row >= @size || column >= @size
  end

  def space_is_free(row, column)
    return true if get_value(row, column).nil?
  end

  def winner?
    check_horizontal || check_vertical ||
      check_diagonal || check_diagonal_inverted
  end

  def values_are_equal?(is_row = false, is_column = false, is_diag = false)
    @size.times do |index|
      break if get_value(
        is_column ? @row : index, is_row ? @column : is_diag ? index : @size - 1 - index
      ) != @mark
      return true if index == @size - 1
    end
  end

  def check_vertical
    values_are_equal?(true, false)
  end

  def check_horizontal
    values_are_equal?(false, true)
  end

  def check_diagonal
    return values_are_equal?(false, false, true) if @row == @column
  end

  def check_diagonal_inverted
    return values_are_equal? if @row + @column == @size - 1
  end
end
