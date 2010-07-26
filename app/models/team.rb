class Team < ActiveRecord::Base
  
  default_scope :order => 'name ASC'
  
  has_many :players
  has_many :entries
  has_many :races, :through => :entries
  
  validates_presence_of :name
  
end
