ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

Facebooker2.app_id = '1'
Facebooker2.secret = 'foo'

class ActiveSupport::TestCase
  
  def score_sideshow_vs_panda
    @race = Factory.create(:sideshow_vs_panda)
    @rotation = @race.rotation
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
    
    @race.fleets(true) # Necessary to load the boats up.

    @race.save!
  end

end
