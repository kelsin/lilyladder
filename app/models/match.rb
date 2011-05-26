class Match < ActiveRecord::Base
  belongs_to :round
  belongs_to :winner, :class_name => 'Registration'
  scope :win, ->(player) { where(:winner_id => player) }
  scope :loss, ->(player) { where('winner_id != ?', player) }
end
