class Rotation < ActiveRecord::Base
  
  attr_accessor :teams
  
  has_many :races, :dependent => :destroy
  
  validates_presence_of :name
  
  before_create :build_races
  
  def build_races
    list = teams.present? ? Team.find(teams) : Team.all
    
    while list.present? do
      # Shift off the team.
      home = list.shift
      
      # This team races everyone left.
      list.each do |away|
        race = races.build
        race.entries.build(:team => home)
        race.entries.build(:team => away)
      end
    end
  end
end