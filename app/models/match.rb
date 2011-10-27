class Match < ActiveRecord::Base
  extend ActiveSupport::Memoizable

  belongs_to :round, :inverse_of => :matches
  belongs_to :winner, :class_name => 'Registration'

  has_many :players, :dependent => :destroy, :inverse_of => :match
  has_many :registrations, :through => :players
  has_many :games, :dependent => :destroy, :inverse_of => :match

  scope :win, lambda { |player| where(:winner_id => player) }
  scope :loss, lambda { |player| where('winner_id is not null and winner_id != ? and id in (?)', player, player.matches.map(&:id)) }
  scope :in_round, lambda { |round_numbers| includes(:round).where('rounds.position' => round_numbers) }
  scope :open, where(:reported_at => nil)
  scope :finished, where('reported_at != ?', nil)

  validates :best_of, :presence => true, :inclusion => { :in => [1,3,5,7,9] }

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

  def player1
    self.players.sort.first
  end
  memoize :player1

  def player2
    self.players.sort.second
  end
  memoize :player2

  def users
    self.players.sort.map(&:registration).map(&:user)
  end

  def user1
    self.player1.user
  end

  def user2
    self.player2.user
  end

  def opponent(user)
    if user1 == user
      player2
    elsif user2 == user
      player1
    end
  end

  def registration_for(user)
    self.players.detect do |player|
      player.registration.user == user
    end.try(:registration)
  end

  def next_game
    self.games.size + 1
  end

  def complete?
    !!self.winner
  end

  def wins_per_player
    self.games.inject({}) do |wins, game|
      wins[game.winner] ||= 0
      wins[game.winner] += 1
      wins
    end
  end

  def games_needed_for_win
    (self.best_of / 2.0).ceil
  end

  def check_for_completeness!
    self.wins_per_player.each do |reg, wins|
      if wins >= self.games_needed_for_win
        self.update_attribute(:winner_id, reg.id)
        break
      end
    end
  end
end
