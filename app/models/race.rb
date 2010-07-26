class Race < ActiveRecord::Base
  belongs_to :rotation
  has_many :entries
  has_many :teams, :through => :entries
  has_many :fleets, :through => :entries
end
