require 'spec_helper'

describe Space do
  it 'initializes as a space object' do
    test_space = Space.new(1)
    test_space.should be_an_instance_of Space
  end

  it 'should know its own ID' do
    test_space = Space.new(2)
    test_space.id.should eq 2
  end

  describe '#mark_by' do
    it 'marks a space with the given symbol' do
      test_space = Space.new(3)
      test_space.mark_by('X')
      test_space.marked_by.should eq 'X'
    end
  end

end
