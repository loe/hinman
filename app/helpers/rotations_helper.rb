module RotationsHelper

  def team_stats(rotation, team)
    "#{team.win_percentage(rotation)}% (#{team.won_races(rotation).length}/#{team.completed_races(rotation).length})"
  end
end
