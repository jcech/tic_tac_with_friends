class Space
  attr_reader :id, :marked_by
  def initialize(id)
    @id = id
    @marked_by = ""
  end

  def mark_by(symbol)
    @marked_by = symbol
  end



end
