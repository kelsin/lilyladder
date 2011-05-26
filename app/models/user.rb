class User < ActiveRecord::Base
  belongs_to :race

  def to_s
    self.name
  end
end
