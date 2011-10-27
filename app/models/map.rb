class Map < ActiveRecord::Base
  belongs_to :map_pool
  has_many :seasons, :through => :map_pools

  has_many :games

  validates :name, :presence => true, :uniqueness => true

  def to_s
    self.name
  end
end
