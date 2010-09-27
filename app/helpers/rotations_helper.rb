module RotationsHelper
  
  def team_stats(rotation, team)
    return if team.completed_races(rotation).length == 0
    "#{team.win_percentage(rotation)}% (#{team.won_races(rotation).length}/#{team.completed_races(rotation).length})"
  end
end
