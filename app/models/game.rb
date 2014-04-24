class Game < ActiveRecord::Base
  attr_reader :board
  validates :player_x, presence: true
  validates :player_o, presence: true
  before_create :build_board

  private

  def build_board
    @board = Board.create()
  end


end
