require 'test_helper'

class RaceTest < ActiveSupport::TestCase
  
  test "should create a race" do
    assert Factory.create(:race)
  end
  
  test "name should be Team A vs Team B" do
    assert_match /Seattle Sideshow vs. NYYC Silver Panda/, Factory.create(:sideshow_vs_panda).name
  end
  
  def score_sideshow_vs_panda
    @race = Factory.create(:sideshow_vs_panda)
    home_boats = @race.home.fleet.boats.map(&:bow)
    away_boats = @race.away.fleet.boats.map(&:bow)
    
    @race.finish_attributes = {
      '0' => {:boat => {:bow => home_boats.pop}},
      '1' => {:boat => {:bow => home_boats.pop}},
      '2' => {:boat => {:bow => away_boats.pop}},
      '3' => {:boat => {:bow => away_boats.pop}},
      '4' => {:boat => {:bow => away_boats.pop}},
      '5' => {:boat => {:bow => home_boats.pop}}
    }
  end
  
  test "Sideshow should be the #winner, Panda should be the #loser" do
    score_sideshow_vs_panda
    assert_equal @race.winner, @race.home
    assert_equal @race.loser, @race.away
  end

  test "home_total should be 9" do
    score_sideshow_vs_panda
    assert_equal @race.home_total, 9
  end
  
  test "away_total should be 12" do
    score_sideshow_vs_panda
    assert_equal @race.away_total, 12
  end

  test "#winner and #loser should be a nil if there are no scores" do
    race = Factory.create(:sideshow_vs_panda)
    assert_nil race.winner
    assert_nil race.loser
  end
end
