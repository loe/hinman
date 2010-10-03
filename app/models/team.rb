class Team < ActiveRecord::Base
  
  default_scope :order => 'name ASC'
  
  has_many :players
  has_many :entries
  has_many :races, :through => :entries
  
  scope :real, where(:ghost => false)
  
  validates_presence_of :name
  
  def rotation_races(rotation)
    races.where(:rotation_id => rotation.id)
  end
  
  def completed_races(rotation)
    return [] if rotation.nil?
    rotation_races(rotation).select { |race| race.winner }
  end
  
  def won_races(rotation)
    completed_races(rotation).select { |race| race.winner.team == self }
  end

  def win_percentage(rotation)
    return 0 if completed_races(rotation).empty?
    (won_races(rotation).length.to_f / completed_races(rotation).length.to_f) * 100
  end

  def rotations
    Rotation.joins(:races => :entries).where(:entries => {:team_id => self}).select('DISTINCT rotations.*')
  end
end
