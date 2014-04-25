require 'spec_helper'

describe Player do
  it { should belong_to :user }
  it { should belong_to :game }

end
