require 'spec_helper'

describe User do
  it { should validate_presence_of :username }
  it { should validate_uniqueness_of :username }

  it { should have_many :players }
  it { should have_many :games }
 it { should have_many :messages }

end
