Factory.define :team do |t|
  t.name { Factory.next(:team_name) }
end

Factory.sequence :team_name do |n|
  "Team #{n}"
end

Factory.define :sideshow, :parent => :team do |t|
  t.name 'Seattle Sideshow'
end

Factory.define :panda, :parent => :team do |t|
  t.name 'NYYC Silver Panda'
end