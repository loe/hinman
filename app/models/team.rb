class Team < ActiveRecord::Base
  
  default_scope :order => 'name ASC'
  
  has_many :players
  has_many :entries
  has_many :races, :through => :entries
  
  validates_presence_of :name
  
  def win_percentage(rotation)
  end
  
  def rotation_races(rotation)
    races.where(:rotation_id => rotation.id).includes(:entries => {:fleet => :boats})
  end
  
  def completed_races(rotation)
    rotation_races(rotation).select { |race| race.winner }
  end
  
  def won_races(rotation)
    completed_races(rotation).select { |race| race.winner.team == self }
  end

  def win_percentage(rotation)
    return 0 if completed_races(rotation).empty?
    (won_races(rotation).length.to_f / completed_races(rotation).length.to_f) * 100
  end
end
