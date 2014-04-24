class Game < ActiveRecord::Base
  attr_reader :board, :players, :current_player
  validates :player_x, presence: true
  validates :player_o, presence: true
  after_create :make_players, :build_board

  def change_turns
    new_current_player = @players.select { |x| x.symbol != @current_player.symbol}
    @current_player = new_current_player
  end

  def win?
    result = false
    [0,3,6].each do |index|
      if @board.spaces[index].marked_by == @board.spaces[index + 1].marked_by && @board.spaces[index+1].marked_by == @board.spaces[index + 2].marked_by
        result = true
        winning_player = @players.select { |p| p.symbol == @board.spaces[index].marked_by }

        self.update(:winner => winning_player.first.user_id)

      end
    end

    [0,1,2].each do |index|
      if @board.spaces[index].marked_by == @board.spaces[index + 3].marked_by && @board.spaces[index+3].marked_by == @board.spaces[index + 6].marked_by
        result = true
        winning_player = @players.select { |p| p.symbol == @board.spaces[index].marked_by }
        self.update(:winner => winning_player.first.user_id)
      end
    end

    if (@board.spaces[4].marked_by == @board.spaces[0].marked_by && @board.spaces[0].marked_by == @board.spaces[8].marked_by) || (@board.spaces[2].marked_by == @board.spaces[4].marked_by && @board.spaces[4].marked_by == @board.spaces[6].marked_by)
      result = true
      winning_player = @players.select { |p| p.symbol == @board.spaces[4].marked_by }
      self.update(:winner => winning_player.first.user_id)
    end
    result
  end




  private

  def build_board
    @board = Board.create
  end

  def make_players
    @players = []
    @players << Player.new(self.player_x, 'X')
    @players << Player.new(self.player_o, 'O')
    @current_player = @players[rand(2)]
  end


end
