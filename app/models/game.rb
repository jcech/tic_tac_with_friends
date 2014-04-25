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
  # def win?
  #   result = false
  #   [0,3,6].each do |index|
  #     if @board.spaces[index].marked_by == @board.spaces[index + 1].marked_by && @board.spaces[index+1].marked_by == @board.spaces[index + 2].marked_by
  #       result = true
  #       winning_player = @players.select { |p| p.symbol == @board.spaces[index].marked_by }

  #       self.update(:winner => winning_player.first.user_id)

  #     end
  #   end

  #   [0,1,2].each do |index|
  #     if @board.spaces[index].marked_by == @board.spaces[index + 3].marked_by && @board.spaces[index+3].marked_by == @board.spaces[index + 6].marked_by
  #       result = true
  #       winning_player = @players.select { |p| p.symbol == @board.spaces[index].marked_by }
  #       self.update(:winner => winning_player.first.user_id)
  #     end
  #   end

  #   if (@board.spaces[4].marked_by == @board.spaces[0].marked_by && @board.spaces[0].marked_by == @board.spaces[8].marked_by) || (@board.spaces[2].marked_by == @board.spaces[4].marked_by && @board.spaces[4].marked_by == @board.spaces[6].marked_by)
  #     result = true
  #     winning_player = @players.select { |p| p.symbol == @board.spaces[4].marked_by }
  #     self.update(:winner => winning_player.first.user_id)
  #   end
  #   result
  # end




  private

  def build_board
    Board.create(:game_id => self.id)

  end



end
