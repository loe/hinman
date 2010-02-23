Factory.define :player do |p|
  p.association   :team
  p.name          'W. Andrew Loe III'
end

Factory.define :mallory, :parent => :player do |p|
  p.association   :team
  p.name          'Mallory Fontenot'
  p.bio           'Texas!'
end