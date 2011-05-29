module MatchesHelper
  def winner(match)
    if match.played?
      if match.bye?
        "Bye (#{link_to match.winner, match.winner.user})".html_safe
      else
        link_to match.winner, match.winner.user
      end
    else
      'Not Played'
    end
  end

  def result(match, registration)
    if match.played?
      if match.bye?
        'Bye'
      elsif match.winner == registration
        'Win'
      else
        'Loss'
      end
    else
      'Not Yet Played'
    end
  end

  def opponent(match, registration)
    (match.players - [registration]).join ', '
  end
end
