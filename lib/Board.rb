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

    def print_board
        puts
        # loop through data structure
        @board.each do |row|
            row.each do |cell|
                # display an existing marker if any, else blank
                cell.nil? ? print(" - ") : print(cell.to_s)
            end
            puts
        end
        puts

    end


end