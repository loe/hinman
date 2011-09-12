require 'rubygems'
require 'csv'
require 'active_support/all'
require 'pp'

#{
  #'Team' => {
    #:players => [
     #{:name => 'Player', :bio => 'Hometown, WA USA'}
    #]
  #}
#}

teams = []
current_team = nil

class Team
  attr_accessor :name, :players, :color

  def initialize(name)
    @name = name
    @players = []
    @color = ''
  end
end

CSV.foreach('teams.csv') do |row|
  if row[0].present?
    current_team = Team.new(row[0])
    teams << current_team
  end
  
  current_team.players << {row[1] => "#{row[2]}, #{row[3]} #{row[4]}"}
end

hash = teams.inject({}) do |m, team|
  m[team.name] = {:color => team.color, :players => team.players}
  m
end

pp hash
