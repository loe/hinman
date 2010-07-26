class Rotation < ActiveRecord::Base
  
  has_many :races
  
  validates_presence_of :name
  
  before_save :build_races
  
  def build_races(teams = Team.all)
    while teams.present? do
      # Shift off the team.
      home = teams.shift
      
      # This team races everyone left.
      teams.each do |team|
        race = races.build
        race.entries.build(:team => home)
        race.entries.build(:team => team)
      end
    end
  end
end