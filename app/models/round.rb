class Round < ActiveRecord::Base
  extend ActiveSupport::Memoizable

  belongs_to :season, :inverse_of => :rounds
  has_many :matches, :dependent => :destroy, :inverse_of => :round
  acts_as_list :scope => :season

  def to_s
    "Round #{self.position}"
  end

  def <=>(other)
    self.starts_at <=> other.starts_at
  end

  def registrations
    self.season.registrations
  end
  memoize :registrations

  def players_without_matches
    self.registrations - self.registrations_with_matches
  end
  memoize :players_without_matches

  def registrations_with_matches
    self.matches.inject([]) do |players, match|
      players + match.players.map(&:registration)
    end
  end
  memoize :registrations_with_matches

  def all_groups
    groups = []

    self.season.each_group do |group, index|
      groups << (group - self.registrations_with_matches)
    end

    return groups
  end

  def zipped_groups
    groups = all_groups
    groups.shift.zip(*groups)
  end

  # Generates matches for all players that don't have any
  def generate_matches
    # Go through each group one at a time
    self.season.each_group do |group, index|
      # Only deal with people without matches
      group -= self.registrations_with_matches

      # Put players with a bye at the top of the group so that they gaurunteed get matches
      group.sort! do |a, b|
        a.byes <=> b.byes
      end.reverse!

      # Group is now sorted, start pairing them as long as we have a pair
      while group.size >= 2
        player1 = group.shift

        # Find people that player1 has not played yet
        player2 = (group - player1.opponents).shuffle.first

        # Remove player2 from the group
        group.delete(player2)

        # Create match
        match = self.matches.create(:group => index)
        match.players.create(:registration => player1)
        match.players.create(:registration => player2)
      end

      # We might have to give a bye
      if group.size == 1
        player = group.shift
        match = self.matches.create(:group => index, :winner => player, :reported_at => Time.now)
        match.players.create(:registration => player)
      end
    end
  end
end
