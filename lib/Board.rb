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
        @mark = mark
        add_mark(r, c, @mark)
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
    space_is_free(row, column) unless out_of_bounds(row, column)
  end

  def out_of_bounds(row, column)
    if row <= @size && column <= @size
      false
    else
      puts "\nThe values selected are out of bounds! Lets try again...\n"
      true
    end
  end

  def space_is_free(row, column)
    if get_value(row, column).nil?
      true
    else
      puts "\nThis space has already been marked! Lets try again...\n"
      false
    end
  end

  def winner?
    check_horizontal || check_vertical || check_diagonal || check_diagonal_inverted
  end

  def values_are_equal?(isRow)
    @size.times do |index|
      break if get_value(isRow ? index : @row, isRow ? @column : index) != @mark
      return true if index == @size - 1
    end
  end

  def check_vertical
    values_are_equal?(true)
  end

  def check_horizontal
    values_are_equal?(false)
  end

  def check_diagonal
    if @row == @column
      @size.times do |index|
        break if get_value(index, index) != @mark
        return true if index == @size - 1
      end
    end
  end

  def check_diagonal_inverted
    if @row + @column == @size - 1
      @size.times do |index|
        break if get_value(index, @size - 1 - index) != @mark
        return true if index == @size - 1
      end
    end
  end
end
