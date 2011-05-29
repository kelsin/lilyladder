class Season < ActiveRecord::Base
  extend ActiveSupport::Memoizable

  has_many :rounds, :order => 'position'
  has_many :registrations, :dependent => :destroy
  has_many :users, :through => :registrations

  def to_s
    self.name
  end

  def players
    self.registrations.sort
  end

  def eligible_users
    User.all - self.users
  end
  memoize :eligible_users

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
    return if group_size == 0

    index = 0
    self.players.each_slice(group_size) do |group|
      yield group, index += 1
    end
  end

  def <=>(other)
    self.name <=> other.name
  end
end
