class Board < ActiveRecord::Base
 has_many :spaces
 belongs_to :game
 after_create :populate_spaces

 private

  def populate_spaces
    9.times do |i|
      self.spaces.create(:number => (i + 1), :marked_by => (i + 1))
    end
  end



end
