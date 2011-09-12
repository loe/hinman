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
colors = ['Purple', 'Black', 'Yellow', 'Lime Green', 'Pink', 'Orange', 'Royal Blue', 'White', 'Gray', 'Light Blue', 'Light Purple', 'Magenta', 'Kelly Green', 'Teal', 'Maroon', 'Red'].shuffle
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
    current_team.color = colors[teams.length]
    teams << current_team
  end

  next unless row[1].present?
  
  current_team.players << {:name => row[1], :bio => "#{row[2]}, #{row[3]} #{row[4]}"}
end

if teams.length.odd?
  bye_team = Team.new("Bye")
  bye_team.color = colors[teams.length]
  teams << bye_team
end

hash = teams.inject({}) do |m, team|
  m[team.name] = {:color => team.color, :players => team.players}
  m
end

pp hash
