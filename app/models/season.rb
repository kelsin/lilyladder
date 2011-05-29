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

  def number_of_groups
    [1, self.registrations.size / 25].max
  end

  def group_size
    if number_of_groups <= 1
      self.registrations.size
    else
      self.registrations.size / self.number_of_groups
    end
  end

  def each_group
    index = 0
    self.players.each_slice(group_size) do |group|
      yield group, index += 1
    end
  end
end
