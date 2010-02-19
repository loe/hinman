class Team < ActiveRecord::Base
  
  has_many :players
  has_many :entries
  has_many :races, :through => :entries
  
  validates_presence_of :name
  
end
