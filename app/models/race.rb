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
  
  def results
    
  end
end
