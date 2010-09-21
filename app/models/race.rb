class Race < ActiveRecord::Base
  
  default_scope :order => 'id ASC'
  
  belongs_to :rotation
  
  has_many :entries, :dependent => :destroy
  has_many :teams, :through => :entries
  has_many :fleets, :through => :entries
  has_many :finishes, :dependent => :destroy
  
  def name
    "#{id} - #{home.team.name} vs. #{away.team.name}"
  end
  
  def home
    entries.first
  end
  
  def away
    entries.last
  end
  
  def results
    if finishes.present?
      "#{id} - #{winner.team.name} def. #{loser.team.name}"
    else
      name
    end
  end
  
  def score(team)
    finishes.where(:boat_id => team.fleet.boats).sum(:position)
  end
  
  def home_total
    @home_total ||= (score(home) + home_penalty)
  end
  
  def away_total
    @away_total ||= (score(away) + away_penalty)
  end
  
  def winner
    (home_total < away_total) ? home : away
  end
  
  def loser
    (home_total > away_total) ? home : away
  end
  
  def finish_attributes=(attributes)
    attributes.each do |key, value|
      finish = finishes.find_or_create_by_position(key.to_i + 1)
      finish.boat = Boat.where(:bow => value[:boat][:bow]).first
      finish.save!
    end
  end
end
