class Entry < ActiveRecord::Base
  
  belongs_to :fleet
  belongs_to :team
  belongs_to :race
  
end
