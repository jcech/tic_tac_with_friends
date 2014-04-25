require 'spec_helper'

describe Space do
it { should belong_to :board }

  describe '#mark_by' do
    it 'marks a space with the given symbol' do

      test_space = Space.create({:number => 3})
      test_player = Player.create({:symbol => "x" })
      test_space.mark_by(test_player)
      test_space.marked_by.should eq 'x'
    end
  end

end
