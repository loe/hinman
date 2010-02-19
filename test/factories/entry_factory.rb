Factory.define :entry do |e|
  e.association :fleet
  e.association :team
  e.association :race
end