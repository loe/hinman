Factory.define :fleet do |f|
  f.color 'Pink'
  f.after_build do |fleet|
    3.times { Factory(:boat, :fleet => fleet) }
  end
end
