class Player < ActiveRecord::Base
  belongs_to :match
  belongs_to :registration
  belongs_to :race

  def name
    self.registration.name
  end

  def to_s
    self.name
  end

  def <=>(other)
    self.registration.user <=> other.registration.user
  end
end
