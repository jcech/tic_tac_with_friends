require 'spec_helper'

describe Game do
  it { should have_many :players }
  it { should have_many :users }
  it { should have_one :board }



  it 'adds a new board to the boards attribute of Game after create' do
    game = Game.create
    game.board.should_not eq nil
  end

  # it 'makes two players before creation' do
  #   game = FactoryGirl.create(:game)
  #   game.players.length.should eq 2

  # end
  # it 'randomly assigns one player as the current player' do
  #   game = FactoryGirl.create(:game)
  #   game.current_player.symbol.should be_true
  # end

  it 'can change the turn' do
    game = Game.create
    playerX = game.players.create(:symbol => 'x')
    playerO = game.players.create(:symbol => 'o')

    game.set_current_player
    starting_player = game.current_player
    game.change_turns
    game.current_player.should_not eq starting_player
  end
  #  describe 'win?' do
  #     it 'returns true if three spaces in a row have the same mark' do
  #       test_game = FactoryGirl.create(:game)
  #       test_game.board.spaces[0].mark_by(test_game.current_player)
  #       test_game.board.spaces[1].mark_by(test_game.current_player)
  #       test_game.board.spaces[2].mark_by(test_game.current_player)
  #       test_game.win?.should eq true

  #       test_game.winner.should eq test_game.current_player.user_id
  #     end
  #     it 'returns true if there is a diagonal win' do
  #       test_game = FactoryGirl.create(:game)
  #       test_game.board.spaces[0].mark_by(test_game.current_player)
  #       test_game.board.spaces[4].mark_by(test_game.current_player)
  #       test_game.board.spaces[8].mark_by(test_game.current_player)
  #       test_game.win?.should eq true
  #       test_game.winner.should eq test_game.current_player.user_id
  #     end
  #   end
end
