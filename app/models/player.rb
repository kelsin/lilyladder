class Player < ActiveRecord::Base
  belongs_to :match, :inverse_of => :players
  belongs_to :registration, :inverse_of => :players
  belongs_to :race, :inverse_of => :players

  def name
    self.registration.name
  end

  def to_s
    self.name
  end

  def <=>(other)
    self.registration.user <=> other.registration.user
  end

  def won?
    self.match.winner == self.registration
  end

  def lost?
    self.match.winner and self.match.winner != self.registration
  end

  def race
    self.registration.race
  end

  def classes
    return 'won' if self.won?
    return 'lost' if self.lost?
  end
end
