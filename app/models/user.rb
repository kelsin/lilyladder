class User < ActiveRecord::Base
  extend ActiveSupport::Memoizable

  belongs_to :race
  has_many :registrations
  has_many :seasons, :through => :registrations

  validates_uniqueness_of :name
  validates_presence_of :bnet_name, :allow_nil => true
  validates_presence_of :bnet_code, :allow_nil => true

  def bnet_id
    "#{self.bnet_name}.#{self.bnet_code}" if self.bnet_name.present? and self.bnet_code.present?
  end

  def to_s
    self.name
  end

  def <=>(other)
    self.name <=> other.name
  end

  def wins
    self.registrations.inject(0) do |sum, registration|
      sum += registration.wins
    end
  end
  memoize :wins

  def losses
    self.registrations.inject(0) do |sum, registration|
      sum += registration.losses
    end
  end
  memoize :losses

  def byes
    self.registrations.inject(0) do |sum, registration|
      sum += registration.byes
    end
  end
  memoize :byes

  def win_percent
    return 0.0 if self.wins == 0
    self.wins.to_f / (self.wins + self.losses + self.byes)
  end
  memoize :win_percent

  def open_matches
    self.registrations.sort.map do |registration|
      registration.matches.open
    end.flatten.sort
  end
  memoize :open_matches
end
