class Rotation < ActiveRecord::Base
  
  attr_accessor :teams
  
  has_many :races, :dependent => :destroy
  has_many :entries, :through => :races
  
  validates_presence_of :name
  
  before_create :build_races
  
  def participants
    entries.map { |e| e.team.name }.uniq.sort.to_sentence
  end
  
  def build_races
    list = teams.present? ? Team.find(teams) : Team.all
    fleets = Fleet.all
    
    next_entry = 0
    while list.present? do
      # Shift off the team.
      home = list.shift
      
      # This team races everyone left.
      list.each do |away|
        race = races.build
        race.entries.build(:team => home, :fleet => fleets.at(next_entry % fleets.size))
        next_entry = next_entry + 1
        race.entries.build(:team => away, :fleet => fleets.at(next_entry % fleets.size))
        next_entry = next_entry + 1
      end
    end
  end
end