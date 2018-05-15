require "Board"

class Game

    attr_accessor :title

    def initialize(title)
        @title = title
        @board = Board.new(3);
    end

    def play
        @board.print_board
    end

end