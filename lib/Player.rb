class Player

    attr_accessor :name, :mark

    def initialize(name, mark, board)
        @name = name
        @mark = mark
        @board = board
    end

    def select_box
        loop do
            row, column = ask_for_coordinates
            if input_valid?(row, column)
                if @board.add_mark(row-1, column-1, @mark)
                    break
                end
            end
        end
    end

    def input_valid?(row, column)
        if row.is_a?(Integer) && column.is_a?(Integer)
            true
        else
            puts "\nThis is an invalid input! Only use numbers separated by a comma >:(\n"
            false
        end
    end

    def ask_for_coordinates
        puts "#{@name}, its your turn! On which box would you like to add a #{@mark}?\nEnter your coordinates in the form: 'row' , 'column'. Eg: 1,1 for 1st box"
        coordinates = gets.strip.split(",").map(&:to_i)
        coordinates
    end

end