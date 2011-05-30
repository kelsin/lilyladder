class MapPool < ActiveRecord::Base
  belongs_to :map
  belongs_to :season
end
