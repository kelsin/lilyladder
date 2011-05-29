class Match < ActiveRecord::Base
  belongs_to :round
  belongs_to :winner, :class_name => 'Registration'
  has_many :players, :dependent => :destroy
  scope :win, ->(player) { where(:winner_id => player) }
  scope :loss, ->(player) { where('winner_id is not null and winner_id != ? and id in (?)', player, player.matches.map(&:id)) }
  scope :in_round, ->(round_numbers) { includes(:round).where('rounds.position' => round_numbers) }
  scope :open, where(:reported_at => nil)
  scope :finished, where('reported_at != ?', nil)

  def to_s
    self.players.sort.map(&:to_s).join ' vs '
  end

  def <=>(other)
    [self.round, self.group, self.bye? ? 1 : 0, self.players.first] <=> [other.round, other.group, other.bye? ? 1 : 0, other.players.first]
  end

  def played?
    !!self.reported_at
  end

  def bye?
    self.players.size == 1 and self.winner == self.players.first.registration
  end
end
