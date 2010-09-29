class Race < ActiveRecord::Base
  
  default_scope :order => 'id ASC'
  
  belongs_to :rotation
  
  has_many :entries, :dependent => :destroy
  has_many :teams, :through => :entries
  has_many :fleets, :through => :entries
  has_many :finishes, :dependent => :destroy
  
  validate :bows_in_fleets
  
  def name
    "#{id} - #{home.team.name} vs. #{away.team.name}"
  end
  
  def next
    rotation.races.where(Race.arel_table[:id].gt(id)).first || self
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
    if value = Rails.cache.read([cache_key, :home_total])
      value
    else
      value = score(home) + home_penalty
      Rails.cache.write([cache_key, :home_total], value)
      value
    end
  end
  
  def away_total
    if value = Rails.cache.read([cache_key, :away_total])
      value
    else
      value = score(away) + away_penalty
      Rails.cache.write([cache_key, :away_total], value)
      value
    end
  end
  
  def winner
    return nil if home_total == away_total
    (home_total < away_total) ? home : away
  end
  
  def loser
    return nil if home_total == away_total
    (home_total > away_total) ? home : away
  end
  
  def finish_attributes=(attributes)
    finishes.all.map(&:destroy) # This must be a Rails 3 issue, finishes.clear and finishes.delete_all raise ActiveRecord::AssociationTypeMismatch
    attributes.each do |key, value|
      finishes.build(:position => key.to_i + 1, :boat => Boat.where(:bow => value[:boat][:bow]).first)
    end
    
    touch
  end

  def bows_in_fleets
    fleet_bows = fleets.map { |f| f.boats.map(&:bow) }.flatten.sort
    finish_bows = finishes.map { |f| f.boat.bow }.sort

    unless fleet_bows == finish_bows
      errors.add(:base, 'sail numbers must be correct')
    end
  end
end
