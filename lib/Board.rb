class Board

    def initialize(size)
        @board = Array.new(size){Array.new(size)}
    end

    def add_mark(row,column, mark)
        @board[row-1][column-1] = mark
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

end