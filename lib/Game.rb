require "Board"
require "Player"
require "Computer"

class Game

    attr_accessor :title

    def initialize(title)
        @title = title
        startup_game             
    end

    def startup_game
        set_up_board
        create_name
        select_mark
        create_players
        set_turn_order
    end
    
    def create_players
        @player_1 = Player.new(@name, @mark, @board)
        @player_2 = Computer.new("R2-D2",@computer_mark, @board)
    end

    def set_turn_order
        option = flip_coin
        @current_player = option == 0 ? @player_1 : @player_2
        @turn = 0
    end

    def flip_coin
        puts "Lets flip a coin to see who goes first..."
        random = rand(2)
        puts random
        random
    end

    def play
        loop do
            puts "\nCurrent board status:"
            @board.print_board
            break if check_tie
            puts "Turn: " + @turn.to_s + ", " + @current_player.name + " plays!"
            @current_player.select_box
            if @board.has_winner?
                @board.print_board
                puts "We have a winner! Congratulations " + @current_player.name
                break
            end
            switch_players
            
        end
        #play_again?
        #TODO Add code to start again
    end

    def play_again?
        puts "Would you like to start again? (y/n)"
        answer = gets.strip
        if answer == "y"
            #restart_game
        end
    end

    def switch_players
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
        @turn+=1
        puts "\nTurn is over, switching players..."
    end

    def check_tie
        if @turn >= @size**2
            puts "Aww game is over, we have a draw!"
            true
        else
            false
        end
    end

    def set_up_board
        puts "Type in the desired board size"
        @size = gets.strip.to_i
        @board = Board.new(@size) 
        #TODO: Add input validation
    end

    def create_name
        puts "Enter your name!"
        @name = gets.strip
        #TODO: Add input validation
    end

    def select_mark
        puts "Select your mark! (type X or O)"
        @mark = gets.strip
        @computer_mark = @mark == "X" ? "O" : "X"
        #TODO: Add input validation
    end


end