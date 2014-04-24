require 'spec_helper'

describe Game do

  it 'builds a board before creation' do
    game = FactoryGirl.create(:game)
    game.board.should be_true
  end

  it 'makes two players before creation' do
    game = FactoryGirl.create(:game)
    game.players.length.should eq 2

  end
end
