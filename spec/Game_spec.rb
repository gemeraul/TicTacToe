require 'Game'
require 'Player'

# RSpec.describe Game, "turns" do
# before :each do
# @game = Game.new "TicTacToe"
# allow(@game).to receive(:create_board).and_return([Board.new(3), 3])

# allow(@game).to receive(:set_up_players).and_return([Player.new(@name, @mark, @board), Computer.new("R2-D2",@computer_mark, @board)])
# end
# context "set turn order" do
#    it "curent player is player_1 when flip_coin returns 0" do
#        allow(@game).to receive(:flip_coin).and_return(0)
#
#        expect(@game.current_player.name).to eq "TestingPlayer"
#    end
#    it "curent player is player_2 when flip_coin returns 1" do
#        allow(@game).to receive(:gets).and_return("3","TestingPlayer", "X","n")
#        allow(@game).to receive(:flip_coin).and_return(1)
#        @game = Game.new "TicTacToe"
#        expect(@game.current_player.name).to eq "R2-D2"
#    end
# end
# end

RSpec.describe Game, 'flip coin' do
  before :each do
    @game = Game.new 'TicTacToe'
  end
  context 'flipping a coin' do
    it 'returns a 0 or 1 randomly' do
      expect(@game.flip_coin).to eq(0).or eq(1)
    end
  end
end
