require "Board"
require "Player"

class Game

    attr_accessor :title

    def initialize(title)
        @title = title
        @board = Board.new(3);
        @human_player = Player.new("Raul", "X", @board)
        @computer_player = Player.new("R2-D2","O", @board)
        @current_player = @human_player
        @turn = 0
    end

    def play
        #TODO: Add logic to ask for name and for which mark you want to use
        loop do
            puts
            puts "Turn: " + @turn.to_s + ", " + @current_player.name + " plays!"
            @board.print_board
            @current_player.select_box
            @board.print_board
            #TODO: Add break when game is over
            switch_players
        end
    end

    def switch_players
        if @current_player == @human_player
            @current_player = @computer_player
        else
            @current_player = @human_player
        end
    end

end