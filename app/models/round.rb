class Round < ActiveRecord::Base
  belongs_to :season
  acts_as_list :scope => :season

  def to_s
    "Round #{self.position}"
  end
end
