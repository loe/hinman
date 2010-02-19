class Entry < ActiveRecord::Base
  
  has_one :fleet
  has_one :team
  has_one :race
  
end
