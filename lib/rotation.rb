@teams = (1..16).map

def enumerate_races(teams)
  home = teams.shift
  teams.each do |t|
    puts "#{home} vs #{t}"
  end
  
  enumerate_races(teams) unless teams.empty?
end

enumerate_races(@teams)

def enumerate_flight(teams)
  home = teams.shift
  away = teams.shift
  
  puts "#{home} vs #{away}"
  enumerate_flight(teams) unless teams.empty?
end

enumerate_flight(@teams)