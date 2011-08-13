class Race < ActiveRecord::Base
  has_many :users
  has_many :players, :inverse_of => :race
  has_many :registrations, :inverse_of => :race

  validates_uniqueness_of :name

  def to_s
    self.name
  end

  def image
    "#{self.name.downcase}.png"
  end

  def icon_class
    "#{self.name.downcase}_icon"
  end
end
