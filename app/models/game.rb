class Game < ActiveRecord::Base
  attr_reader :board, :players
  validates :player_x, presence: true
  validates :player_o, presence: true
  after_create :make_players, :build_board

  private

  def build_board
    @board = Board.create()
  end

  def make_players
    @players = []
    @players << Player.new(self.player_x, 'X')
    @players << Player.new(self.player_o, 'O')
  end


end
