class Registration < ActiveRecord::Base
  extend ActiveSupport::Memoizable

  belongs_to :season
  belongs_to :user
  has_many :players
  has_many :matches, :through => :players
  has_many :wins, :foreign_key => 'winner_id', :class_name => 'Match'

  validates_uniqueness_of :user_id, :scope => :season_id

  def wins(round = nil)
    self.matches.select do |match|
      match.winner_id == self.id and !match.bye?
    end.size
  end
  memoize :wins

  def losses(round = nil)
    self.matches.select do |match|
      match.winner_id and match.winner_id != self.id
    end.size
  end
  memoize :losses

  def byes(round = nil)
    self.matches.select do |match|
      match.bye?
    end.size
  end
  memoize :byes

  def win_percent
    return 0.0 if self.wins == 0
    self.wins.to_f / (self.wins + self.losses + self.byes)
  end
  memoize :win_percent

  def opponents
    self.matches.map do |match|
      match.players.map(&:registration) - [self]
    end.flatten.uniq
  end

  def name
    self.user.name
  end

  def to_s
    self.name
  end

  def <=>(other)
    [other.wins, self.losses, self.user.name] <=> [self.wins, other.losses, other.user.name]
  end
end
