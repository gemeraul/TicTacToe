require "Board"
require "Player"

class Game

    attr_accessor :title

    def initialize(title)
        @title = title
        @board = Board.new(3);
        @human_player = Player.new("Raul", "X")
        @computer_player = Player.new("R2D2","O")
        @current_player = @human_player
        @turn = 0
    end

    def play
        puts
        puts "Turn: " + @turn.to_s + ", " + @current_player.name + " plays!"
        @board.print_board
        @move_x, @move_y = @current_player.select_box
        @board.add_mark(@move_x,@move_y,@current_player.mark)
        @board.print_board
        # TODO: Switch turns and add loop
    end

end