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
      if evaluate_space_mark(index) == evaluate_space_mark(index+1) && evaluate_space_mark(index+1) == evaluate_space_mark(index+2)

        result = true
        self.set_winning_player(index)
      end
    end

    [1,2,3].each do |index|
      if evaluate_space_mark(index) == evaluate_space_mark(index + 3) && evaluate_space_mark(index + 3) == evaluate_space_mark(index+6)
        result = true
        self.set_winning_player(index)
      end
    end

    if evaluate_space_mark(5) == evaluate_space_mark(1) && evaluate_space_mark(1) == evaluate_space_mark(9) || evaluate_space_mark(3) == evaluate_space_mark(5) && evaluate_space_mark(5) == evaluate_space_mark(7)
      result = true
      self.set_winning_player(5)
    end
    result
  end

  def evaluate_space_mark(number)
    self.board.spaces.find_by(:number => number).marked_by

  end

  def set_winning_player(number)
    winning_player = self.players.select { |p| p.symbol == self.board.spaces.find_by( :number => number).marked_by }
    self.update(:winner => winning_player.first.user_id)
  end


  private

  def build_board
    Board.create(:game_id => self.id)

  end



end
