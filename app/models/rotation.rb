class Rotation < ActiveRecord::Base
  
  has_many :races
  
  validates_presence_of :name
  
  def generate!
    teams = Team.all
    
    while teams.present? do
      # Shift off the team.
      home = teams.shift
      
      # This team races everyone left.
      teams.each do |team|
        race = Race.new
        race.entries.build(:team => home)
        race.entries.build(:team => team)
        
        race.save!
      end
    end
  end
end