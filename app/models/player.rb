class Player < ActiveRecord::Base
  belongs_to :match
  belongs_to :registration
  belongs_to :race
end
