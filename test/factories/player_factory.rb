Factory.define :player do |p|
  p.association   :team, :factory => :sideshow
  p.name          'W. Andrew Loe III'
end

Factory.define :mallory, :parent => :player do |p|
  p.association   :team, :factory => :sideshow
  p.name          'Mallory Fontenot'
  p.bio           'Texas!'
end