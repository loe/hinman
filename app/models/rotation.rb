class Rotation < ActiveRecord::Base
  
  attr_accessor :new_round
  
  serialize :teams
  serialize :fleets
  
  has_many :races, :dependent => :destroy
  has_many :entries, :through => :races
  
  validates_presence_of :name, :participation_value
  
  before_create :build_races
  before_update :build_races, :if => :new_round?
  
  def participants
    entries.map { |e| e.team.name }.uniq.sort.to_sentence
  end

  def new_round?
    new_round.to_i != 0
  end
  
  def build_races
    team_list = teams.present? ? Team.find(teams) : Team.all
    fleet_list = fleets.present? ? Fleet.find(fleets) : Fleet.all
    
    number_of_races_for_a_team = team_list.length - 1
    next_entry = 0
    team_list.sort_by(&:color)
    
    for i in 1..number_of_races_for_a_team
      internal_teams = team_list.dup
      
      while internal_teams.present? do
        race = races.build
        race.entries.build(:team => internal_teams.shift, :fleet => fleet_list.at(next_entry % fleet_list.size))
        next_entry = next_entry + 1
        race.entries.build(:team => internal_teams.pop, :fleet => fleet_list.at(next_entry % fleet_list.size))
        next_entry = next_entry + 1
      end
      
      team_list.push(team_list.delete_at(1))
    end
    
  end
end
