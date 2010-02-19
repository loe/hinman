class Fleet < ActiveRecord::Base
  
  has_many :entries
  has_many :boats
  
  validates_presence_of :color
  
end
