class Space
  attr_reader :id, :marked_by
  def initialize(id)
    @id = id
    @marked_by = ""
  end

  def mark_by(player)
    @marked_by = player.symbol
  end



end
