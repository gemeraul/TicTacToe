class Board

    def initialize(size)
        @size = size
        @board = Array.new(size){Array.new(size)}
    end

    def add_mark(row,column, mark)
        if location_is_valid?(row,column)
            @board[row-1][column-1] = mark
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
            puts "The values selected are out of bounds! Try again..."
            true
        end
    end

    def space_is_free(row, column)
        if get_value(row, column).nil?
            true
        else
            puts "This space has already been marked! Try again..."
            false
        end
    end

    def has_winner
        false
    end

end