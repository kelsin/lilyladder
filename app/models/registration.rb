class Registration < ActiveRecord::Base
  extend ActiveSupport::Memoizable

  belongs_to :season
  belongs_to :user
  has_many :players
  has_many :matches, :through => :players

  def wins(round = nil)
    self.matches.select do |match|
      match.winner_id == self.id
    end.size
  end
  memoize :wins

  def losses(round = nil)
    self.matches.size - self.wins
  end
  memoize :losses

  def to_s
    self.user.to_s
  end

  def <=>(other)
    [other.wins, self.losses, self.user.name] <=> [self.wins, other.losses, other.user.name]
  end
end
