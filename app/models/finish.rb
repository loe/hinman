class Finish < ActiveRecord::Base
  
  default_scope :order => 'position ASC'
  
  belongs_to :race
  belongs_to :boat
  
end
