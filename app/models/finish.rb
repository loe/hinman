class Finish < ActiveRecord::Base
  
  belongs_to :race
  belongs_to :boat
  
end
