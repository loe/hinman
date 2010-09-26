Factory.define :fleet do |f|
  f.color 'Pink'
  f.after_build do |fleet|
    fleet.boats = (0..2).map {Factory(:boat, :fleet => fleet)}
  end
end
