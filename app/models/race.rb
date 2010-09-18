class Race < ActiveRecord::Base
  
  default_scope :order => 'id ASC'
  
  belongs_to :rotation
  
  has_many :entries, :dependent => :destroy
  has_many :teams, :through => :entries
  has_many :fleets, :through => :entries
  has_many :finishes
  
  def name
    "#{id} - #{teams.map(&:name).join(' vs. ')}"
  end
  
  def home
    entries.first
  end
  
  def away
    entries.last
  end
  
  def results
    
  end
  
  def home_score
    finishes.where(:boat_id => home.fleet.boats).sum(:position)
  end
  
  def away_score
    finishes.where(:boat_id => away.fleet.boats).sum(:position)
  end
  
  def home_total
    home_score + home_penalty
  end
  
  def away_total
    away_score + away_penalty
  end
end
