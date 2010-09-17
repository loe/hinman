class Fleet < ActiveRecord::Base
  
  default_scope :order => 'id ASC'
  
  has_many :entries
  has_many :boats
  
  validates_presence_of :color
  
end
