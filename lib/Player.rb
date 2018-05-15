class Player

    attr_accessor :name, :mark

    def initialize(name, mark, board)
        @name = name
        @mark = mark
        @board = board
    end

    def select_box
        puts "#{@name}, its your turn! On which box would you like to add a #{@mark}? "
        puts "Enter your coordinates in the form: 'row' , 'column'. Eg: 1,1 for 1st box"
        @row, @column = gets.strip.split(",").map(&:to_i)
        @board.add_mark(@row, @column, @mark)
    end

    #TODO: Add responsabilities functions

end