class Player < ActiveRecord::Base
  
  default_scope :order => 'id ASC'

  belongs_to :team
  
  validates_presence_of :name, :team
  
end
