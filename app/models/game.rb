class Game < ActiveRecord::Base
  extend ActiveSupport::Memoizable

  belongs_to :match
  belongs_to :winner, :class_name => 'Registration'
  belongs_to :map
  acts_as_list :scope => :match_id

  validates_presence_of :map_id
end
