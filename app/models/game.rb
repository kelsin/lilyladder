class Game < ActiveRecord::Base
  extend ActiveSupport::Memoizable

  belongs_to :match
  belongs_to :winner, :class_name => 'Registration'
  belongs_to :map
  acts_as_list :scope => :match_id

  mount_uploader :replay, ReplayUploader

  validates :winner_id, :presence => true
  validates :map_id, :presence => true
  validates :replay, :presence => true
end
