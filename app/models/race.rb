class Race < ActiveRecord::Base
  
  belongs_to :rotation
  
  has_many :entries, :dependent => :destroy
  has_many :teams, :through => :entries
  has_many :fleets, :through => :entries
  
  def name
    "#{id} - #{teams.map(&:name).join(' vs. ')}"
  end
  
  def result
    # TODO: Show the team combinations and declare a winner.
  end
end
