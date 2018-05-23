require 'Board'
require 'Player'
require 'Computer'

# This is a really cool game of TicTacToe
class Game
  attr_accessor :title, :current_player, :turn

  def initialize(title)
    @title = title
  end

  def startup_game
    @board, @size = create_board
    select_mark
    @player1, @player2 = set_up_players
    set_turn_order
  end

  def set_turn_order
    option = flip_coin
    @current_player = option.zero? ? @player1 : @player2
    @turn = 0
  end

  def flip_coin
    puts 'Lets flip a coin to see who goes first...'
    random = rand(2)
    random
  end

  def play
    startup_game
    loop do
      @board.print_board
      puts 'Turn: ' + @turn.to_s + ', ' + @current_player.name + ' plays!'
      @current_player.select_box
      break if check_game_over
      switch_players
    end
    play_again?
  end

  def play_again?
    puts 'Would you like to start again? (y/n)'
    answer = gets.strip
    if answer == 'y'
      play
    else
      exit(true)
    end
  end

  def switch_players
    @current_player = if @current_player == @player1
                        @player2
                      else
                        @player1
                      end
    @turn += 1
    puts "\nTurn is over, switching players..."
  end

  def check_game_over
    if @board.winner?
      @board.print_board
      puts 'We have a winner! Congratulations ' + @current_player.name
      true
    elsif check_tie
      puts 'Aww game is over, we have a draw!'
      true
    end
  end

  def check_tie
    return true if @turn >= @size**2
  end

  def create_board
    puts 'Type in the desired board size'
    size = gets.strip.to_i
    [Board.new(size), size]
    # TODO: Add input validation
  end

  def set_up_players
    puts 'Enter your name!'
    @name = gets.strip
    [
      Player.new(@name, @mark, @board),
      Computer.new('R2-D2', @computer_mark, @board)
    ]
    # TODO: Add input validation
  end

  def select_mark
    puts 'Select your mark! (type X or O)'
    @mark = gets.strip
    @computer_mark = @mark == 'X' ? 'O' : 'X'
    # TODO: Add input validation
  end
end
