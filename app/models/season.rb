class Season < ActiveRecord::Base
  has_many :rounds, :order => 'position'
  has_many :registrations
  has_many :users, :through => :registrations

  def to_s
    self.name
  end

  def players
    self.registrations.sort
  end

  def each_group
    data = []
    self.players.reverse.each_slice(30) do |group|
      data << group.reverse
    end
    data.reverse.each_with_index do |group, index|
      yield group, index + 1
    end
  end
end
