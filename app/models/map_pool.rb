class MapPool < ActiveRecord::Base
  has_many :maps
  belongs_to :season
end
