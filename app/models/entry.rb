class Entry < ActiveRecord::Base
  
  default_scope :order => 'id ASC'
  
  belongs_to :fleet
  belongs_to :team
  belongs_to :race
  
end
