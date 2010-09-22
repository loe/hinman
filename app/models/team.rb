class Team < ActiveRecord::Base
  
  default_scope :order => 'name ASC'
  
  has_many :players
  has_many :entries
  has_many :races, :through => :entries
  
  validates_presence_of :name
  
  def win_percentage(rotation)
    total_races = races.where(:rotation_id => rotation.id).all
    
    completed_races = total_races.select { |race| race.winner }  
    wins = completed_races.each { |race| race.winner.team.id.to_i == self.id.to_i }
    
    wins.length
  end
end
