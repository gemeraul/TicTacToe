class Computer < Player

    attr_accessor :name, :mark

    def initialize(name, mark, board)
        @name = name
        @mark = mark
        @board = board
    end

    def select_box
        puts "Its #{@name} turn! The AI will add a random #{@mark} mark"
        @board.add_random_mark(@mark)
    end

end