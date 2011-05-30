class Map < ActiveRecord::Base
  has_many :map_pools
  has_many :seasons, :through => :map_pools

  has_many :games

  def to_s
    self.name
  end
end
