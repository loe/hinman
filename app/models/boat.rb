class Boat < ActiveRecord::Base
  
  belongs_to :fleet
  
  validates_presence_of :bow, :fleet
  
end
