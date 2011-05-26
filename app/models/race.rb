class Race < ActiveRecord::Base
  has_many :users
  has_many :players

  def to_s
    self.name
  end
end
