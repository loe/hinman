class Race < ActiveRecord::Base
  
  has_many :entries
  has_many :teams, :through => :entries
  has_many :fleets, :through => :entries
  
end
