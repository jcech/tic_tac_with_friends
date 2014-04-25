class Game < ActiveRecord::Base
  has_many :players
  has_many :users, through: :players
  has_one :board

  after_create :build_board

  def active_player
    Player.find(self.current_player)
  end

  def change_turns
    new_current_player = self.players.select { |x| x.symbol != self.active_player.symbol}
    self.update(:current_player => new_current_player.first.id)
  end

  def set_current_player
    self.update(:current_player => self.players[rand(2)].id)
  end

  def win?
    result = false

    [1,4,7].each do |index|
      if self.board.spaces.find_by(:number => index).marked_by == self.board.spaces.find_by(:number => (index +1)).marked_by && self.board.spaces.find_by(:number => (index +1)).marked_by == self.board.spaces.find_by(:number => (index + 2)).marked_by

        result = true
        winning_player = self.players.select { |p| p.symbol == self.board.spaces.find_by(:number => index).marked_by }
        self.update(:winner => winning_player.first.user_id)
      end
    end

    [1,2,3].each do |index|
      if self.board.spaces.find_by(:number => index).marked_by == self.board.spaces.find_by(:number => (index + 3)).marked_by && self.board.spaces.find_by(:number => (index +3)).marked_by == self.board.spaces.find_by(:number => (index + 6)).marked_by

        result = true
        winning_player = self.players.select { |p| p.symbol == self.board.spaces.find_by(:number => index).marked_by }
        self.update(:winner => winning_player.first.user_id)
      end
    end

    if (self.board.spaces.find_by(:number => 5).marked_by == self.board.spaces.find_by(:number => 1).marked_by && self.board.spaces.find_by(:number => 1).marked_by == self.board.spaces.find_by(:number => 9).marked_by) || (self.board.spaces.find_by(:number => 3).marked_by == self.board.spaces.find_by(:number => 5).marked_by && self.board.spaces.find_by(:number => 5).marked_by == self.board.spaces.find_by(:number => 7).marked_by)
      result = true
      winning_player = self.players.select { |p| p.symbol == self.board.spaces.find_by(:number => 5).marked_by }
      self.update(:winner => winning_player.first.user_id)
    end
    result
  end




  private

  def build_board
    Board.create(:game_id => self.id)

  end



end
