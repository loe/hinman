require 'test_helper'

class TeamTest < ActiveSupport::TestCase

  test "should require a name" do
    team = Factory.build(:team, :name => nil)
    assert !team.valid?
  end

  test "completed races should be 1 for both teams" do
    score_sideshow_vs_panda
    assert_equal @race.winner.team.completed_races(@rotation).length, 1
    assert_equal @race.loser.team.completed_races(@rotation).length, 1
  end  

  test "won races should be 1 for the winning team" do
    score_sideshow_vs_panda
    assert_equal @race.winner.team.won_races(@rotation).length, 1
  end

  test "won races should be 0 for the losing team" do
    score_sideshow_vs_panda
    assert_equal @race.loser.team.won_races(@rotation).length, 0
  end
  
  test "win percentage for the winning team should be 100" do
    score_sideshow_vs_panda
    assert_equal @race.winner.team.win_percentage(@rotation), 100
  end

  test "win percentage for the losing team should be 0" do
    score_sideshow_vs_panda
    assert_equal @race.loser.team.win_percentage(@rotation), 0
  end

end
