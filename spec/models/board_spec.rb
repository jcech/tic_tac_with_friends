require 'spec_helper'

describe Board do
  it {should have_many :spaces}
  it { should belong_to :game }
#   describe "#initialize" do
#     it "sets attributes of board upon creation" do
#       b = Board.new()
#       b.should be_an_instance_of Board
#     end
#   end
#   describe ".create" do
#     it "should fill the space array with nine instances of space" do
#       b = Board.create()
#       b.spaces.length.should eq 9
#     end
#   end
end
