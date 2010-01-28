class Player < ActiveRecord::Base

  belongs_to :team

  validates_presence_of :name, :team
end
