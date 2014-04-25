class Space < ActiveRecord::Base
  belongs_to :board

  def mark_by(player)
    self.update(:marked_by => player.symbol)
  end
end

