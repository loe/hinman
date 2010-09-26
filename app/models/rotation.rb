class Rotation < ActiveRecord::Base
  
  attr_accessor :teams, :fleets
  
  has_many :races, :dependent => :destroy
  has_many :entries, :through => :races
  
  validates_presence_of :name, :participation_value
  
  before_create :build_races
  
  def participants
    entries.map { |e| e.team.name }.uniq.sort.to_sentence
  end
  
  def build_races
    team_list = teams.present? ? Team.find(teams) : Team.all
    fleet_list = fleets.present? ? Fleet.find(fleets) : Fleet.all
    
    next_entry = 0
    while team_list.present? do
      # Shift off the team.
      home = team_list.shift
      
      # This team races everyone left.
      team_list.each do |away|
        race = races.build
        race.entries.build(:team => home, :fleet => fleet_list.at(next_entry % fleet_list.size))
        next_entry = next_entry + 1
        race.entries.build(:team => away, :fleet => fleet_list.at(next_entry % fleet_list.size))
        next_entry = next_entry + 1
      end
    end
  end
end
