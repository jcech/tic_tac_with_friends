require 'spec_helper'

describe Game do

  it { should have_many :players }
  it { should have_many :users }
  it { should have_one :board }



  it 'adds a new board to the boards attribute of Game after create' do
    game = Game.create
    game.board.should_not eq nil
  end

  describe 'set_current_player' do
    it ' should randomly set the current_player attribute to one of the players user ids. Will be run at the beginning of the game' do
      game = Game.create
      player1 = Player.create(:user_id => 1, :game_id => game.id)
      player1.update(:id => 1)
      player2 = Player.create(:user_id => 1, :game_id => game.id)
      player2.update(:id => 2)
      game.update(:current_player => 5)
      game.set_current_player
      game.current_player.should_not eq 5
    end
  end

  describe 'active_player' do
    it ' should return the player object that corresponds to the current player id' do
      game = Game.create
      player1 = Player.create(:user_id => 1, :game_id => game.id)
      player1 = Player.create(:user_id => 2, :game_id => game.id)
      game.set_current_player
      game.active_player.user_id.should be_true
    end
  end

  it 'can change the turn' do
    game = Game.create
    playerX = game.players.create(:symbol => 'x')
    playerO = game.players.create(:symbol => 'o')

    game.set_current_player
    starting_player = game.current_player
    game.change_turns
    game.current_player.should_not eq starting_player
  end
   describe 'win?' do
      it 'returns true if three spaces in a row have the same mark' do
        test_game = Game.create

        player = Player.create(:symbol => "x", :user_id => 1, :game_id => test_game.id)
        test_game.update(:current_player => player.id )

        test_game.board.spaces.find_by(:number => 1).mark_by(test_game.active_player)

        test_game.board.spaces.find_by(:number => 2).mark_by(test_game.active_player)
        test_game.board.spaces.find_by(:number => 3).mark_by(test_game.active_player)
        test_game.win?.should eq true

        test_game.winner.should eq test_game.active_player.user_id
      end

      it 'returns true if there is a vertical win' do
        test_game = Game.create

        player = Player.create(:symbol => "x", :user_id => 1, :game_id => test_game.id)
        test_game.update(:current_player => player.id )

        test_game.board.spaces.find_by(:number => 1).mark_by(test_game.active_player)

        test_game.board.spaces.find_by(:number => 4).mark_by(test_game.active_player)
        test_game.board.spaces.find_by(:number => 7).mark_by(test_game.active_player)
        test_game.win?.should eq true

        test_game.winner.should eq test_game.active_player.user_id
      end

      it 'returns true if there is a diagonal win' do
        test_game = Game.create

        player = Player.create(:symbol => "x", :user_id => 1, :game_id => test_game.id)
        test_game.update(:current_player => player.id )

        test_game.board.spaces.find_by(:number => 1).mark_by(test_game.active_player)

        test_game.board.spaces.find_by(:number => 5).mark_by(test_game.active_player)
        test_game.board.spaces.find_by(:number => 9).mark_by(test_game.active_player)
        test_game.win?.should eq true

        test_game.winner.should eq test_game.active_player.user_id
      end
    end

    describe '#evaluate_space_mark' do
      it 'should return the mark of the given space number' do
        test_game = Game.create

        player = Player.create(:symbol => "x", :user_id => 1, :game_id => test_game.id)
        test_game.update(:current_player => player.id )
        test_game.board.spaces.find_by(:number => 1).mark_by(test_game.active_player)
        test_game.evaluate_space_mark(1).should eq 'x'
      end
    end

    describe '#set_winning_player' do
      it 'should set the winning player to the player with the symbol of the given space number' do
        test_game = Game.create
        player = Player.create(:symbol => "x", :user_id => 1, :game_id => test_game.id)
        test_game.update(:current_player => player.id )
        test_game.board.spaces.find_by(:number => 1).mark_by(test_game.active_player)
        test_game.set_winning_player(1)
        test_game.winner.should eq test_game.active_player.user_id
      end
    end
end
