# encoding: utf-8

module RacesHelper
  
  def winner_or_loser(race, entry)
    return content_tag(:strong, '✓') if race.winner == entry
    return content_tag(:strong, '✗') if race.loser == entry
  end

end
