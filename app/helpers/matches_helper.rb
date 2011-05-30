module MatchesHelper
  def bye
    '<span class="bye">Bye</span>'.html_safe
  end

  def winner(match)
    if match.played?
      if match.bye?
        "#{link_to player(match.winner, 'won'), match.winner.user} - #{bye}".html_safe
      else
        link_to match.winner, match.winner.user
      end
    else
      '<span class="not_played_yet">Not Played Yet</span>'.html_safe
    end
  end

  def player1(match)
    link_to player(match.player1, match.player1.classes), match.player1.registration.user
  end

  def player2(match)
    if match.bye?
      bye
    else
      link_to player(match.player2, match.player2.classes), match.player2.registration.user
    end
  end

  def players(match)
    match.players.sort.map do |player|
      player(player, player.classes)
    end.join(' vs ').html_safe
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
      '<span class="not_played_yet">Not Played Yet</span>'.html_safe
    end
  end

  def game_result(game)
    if game.winner
      link_to match.winner, match.winner.user
    else
      '<span class="not_played_yet">Not Played Yet</span>'.html_safe
    end
  end

  def opponent(match, registration)
    p = (match.players.map(&:registration) - [registration]).first
    link_to player(p), p.user
  end
end
