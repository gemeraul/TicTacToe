require "Board"
require "Player"

class Game

    attr_accessor :title

    def initialize(title)
        @title = title
        set_up_board_size
        create_name
        select_mark
        @board = Board.new(@size)
        @human_player = Player.new(@name, @mark, @board)
        @computer_player = Player.new("R2-D2",@computer_mark, @board)
        @current_player = @human_player
        @turn = 0
    end

    def play
        loop do
            puts
            break if check_tie
            puts "Turn: " + @turn.to_s + ", " + @current_player.name + " plays!"
            puts "Current board status:"
            @board.print_board
            @current_player.select_box
            switch_players
            @turn+=1
            puts
            puts "Turn is over, switching players..."
        end
    end

    def switch_players
        if @current_player == @human_player
            @current_player = @computer_player
        else
            @current_player = @human_player
        end
    end

    def check_tie
        if @turn >= @size**2
            puts "Aww game is over, we have a draw!"
            true
        else
            false
        end
    end

    def set_up_board_size
        puts "Type in the desired board size"
        @size = gets.strip.to_i
    end

    def create_name
        puts "Enter your name!"
        @name = gets.strip
    end

    def select_mark
        puts "Select your mark! (type X or O)"
        @mark = gets.strip
        @computer_mark = @mark == "X" ? "O" : "X"
    end


end