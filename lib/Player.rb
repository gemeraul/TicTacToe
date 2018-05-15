class Player

    attr_accessor :name, :mark

    def initialize(name, mark, board)
        @name = name
        @mark = mark
        @board = board
    end

    def select_box
        loop do
            puts "#{@name}, its your turn! On which box would you like to add a #{@mark}? "
            puts "Enter your coordinates in the form: 'row' , 'column'. Eg: 1,1 for 1st box"
            @row, @column = gets.strip.split(",").map(&:to_i)
            if input_valid?
                if @board.add_mark(@row-1, @column-1, @mark)
                    break
                end
            end
        end
    end

    def input_valid?
        if @row.is_a?(Integer) && @column.is_a?(Integer)
            true
        else
            puts "\nThis is an invalid input! Only use numbers separated by a comma >:(\n"
            false
        end
    end

end