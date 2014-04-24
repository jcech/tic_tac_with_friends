class Player
  attr_reader :user_id, :symbol

  def initialize(user_id, symbol)
    @user_id = user_id
    @symbol = symbol
  end
end
