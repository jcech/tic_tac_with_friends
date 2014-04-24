require 'spec_helper'

describe Player do
  it 'initializes as a Player object' do
    player = Player.new(1, 'X')
    player.should be_an_instance_of Player
    player.user_id.should eq 1
  end
end
