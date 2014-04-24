require 'spec_helper'

describe Game do
  it { should validate_presence_of :player_x }
  it { should validate_presence_of :player_o }

  it 'builds a board before creation' do
    game = FactoryGirl.create(:game)
    game.board.should be_true
  end
end
