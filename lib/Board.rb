class Board

    def initialize(size)
        @size = size
        @board = Array.new(size){Array.new(size)}
    end

    def add_mark(row,column, mark)
        if location_is_valid?(row,column)
            @board[row-1][column-1] = mark
            @row = row
            @column = column
            @mark = mark
            true
        else
            false
        end
    end

	def get_value(row, column)
		@board[row-1][column-1]
	end

    def print_board
        puts
        @board.each do |row|
            row.each do |cell|
                cell.nil? ? print(" - ") : print(" " + cell.to_s + " ")
            end
            puts
        end
        puts

    end

    def location_is_valid?(row, column)
        if !out_of_bounds(row, column)
            space_is_free(row, column)
        end
    end

    def out_of_bounds(row, column)
        if row <= @size && column <= @size
            false
        else
            puts
            puts "The values selected are out of bounds! Try again..."
            puts
            true
        end
    end

    def space_is_free(row, column)
        if get_value(row, column).nil?
            true
        else
            puts
            puts "This space has already been marked! Try again..."
            puts
            false
        end
    end

    def has_winner?
        check_horizontal || check_vertical
    end

    def check_vertical
        @size.times do |row|
            if get_value(row+1, @column) != @mark
                break
            end
            if row == @size
                true
            end
        end
    end

    def check_horizontal
        @size.times do |column|
            if get_value(@row, column+1) != @mark
                break
            end
            if column == @size
                true
            end
        end
    end

    def check_diagonal(row, column, mark)
        false
    end

end