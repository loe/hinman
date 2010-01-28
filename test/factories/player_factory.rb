Factory.define :player do |p|
  p.name          'W. Andrew Loe III'
  p.association   :team
end

Factory.define :mallory, :parent => :player do |p|
  p.name          'Mallory Fontenot'
  p.bio           'Texas!'
end