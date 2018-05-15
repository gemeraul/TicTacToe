class Board

    def initialize(size)
        @board = Array.new(size){Array.new(size)}
    end

    def add_mark(row,column, mark)
        board[row][column] = mark
    end

	def get_value(row, column)
		board[row][column]
	end

end