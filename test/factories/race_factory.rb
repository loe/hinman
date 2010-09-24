Factory.define :race do |r|
  r.association :rotation
end

Factory.define :sideshow_vs_panda, :parent => :race do |r|
  r.entries { |r| [r.association(:entry, :team => Factory(:sideshow), :fleet => Factory(:fleet, :color => 'Green')), r.association(:entry, :team => Factory(:panda), :fleet => Factory(:fleet, :color => 'Blue'))] }
end
