# coding: utf-8
{"Larchmont Yacht Club"=>
  {:color=>"Purple",
   :players=>
    [{"Danny Pletsch"=>"Greenwich, CT USA"},
     {"Megan Magill"=>"Greenwich, CT USA"},
     {"Cardwell Potts"=>"Greenwich, CT USA"},
     {"James Gilman"=>"Stamford, CT USA"},
     {"Michael Menninger"=>"Newport Beach, CA USA"},
     {"Ashley Phillips"=>"Charleston, SC USA"}]},
 "Minor Threat"=>
  {:color=>"Black",
   :players=>
    [{"Cy Thompson"=>"Newport, RI USA"},
     {"Kelly Stannard"=>"Salem, CT USA"},
     {"Charlie Buckingham"=>"Newport Beach, CA USA"},
     {"Alex Taylor"=>"Boston, MA USA"},
     {"Tyler Sinks"=>"San Diego, CA USA"},
     {"Lucy Wallace"=>"Middletown, RI USA"}]},
 "Pretty Good Thirds"=>
  {:color=>"Yellow",
   :players=>
    [{"Ben Quatromoni"=>"Portsmouth, RI USA"},
     {"Emily Anderson"=>"Northport, NY USA"},
     {"Charlie Enright"=>"Bristol, RI USA"},
     {"Meris Tombari"=>"Bristol, RI USA"},
     {"Kaitlin Storck"=>"Huntington, NY USA"},
     {"Lyndsey Gibbons-Neff"=>"Boston, MA USA"}]},
 "Seattle Sideshow"=>
  {:color=>"Lime Green",
   :players=>
    [{"W. Andrew Loe III"=>"Seattle, WA USA"},
     {"Mallory Fontenot"=>"Seattle, WA USA"},
     {"Anthony Boscolo"=>"Seattle, WA USA"},
     {"Jen Morgan"=>"Seattle, WA USA"},
     {"Dalton Bergan"=>"Seattle, WA USA"},
     {"Lindsay Bergan"=>"Seattle, WA USA"}]},
 "SoCal Luchadores"=>
  {:color=>"Pink",
   :players=>
    [{"Brian Bissell"=>"San Diego, CA USA"},
     {"Rebecca Nygren"=>"San Diego, CA USA"},
     {"Andrew Campbell"=>"Washington, DC USA"},
     {"Jacqueline Campbell"=>"Washington, DC USA"},
     {"Nevin Snow"=>"San Diego, CA USA"},
     {"Allie Blecher"=>"Fullerton, CA USA"}]},
 "Southern California Trojans"=>
  {:color=>"Orange",
   :players=>
    [{"Colin Campbell"=>"Manhattan Beach, CA USA"},
     {"Ben Palmer"=>"Los Angeles, CA USA"},
     {"Michael Anderson-Mitterling"=>"Irvine, CA USA"},
     {"Kyrstin Munson"=>"Manhattan Beach, CA USA"},
     {"Greg Helias"=>"Laguna Beach, CA USA"},
     {"Melanie Roberts"=>"San Francisco, CA USA"}]},
 "Spinnaker"=>
  {:color=>"Royal Blue",
   :players=>
    [{"Ben Saxton"=>"Ashwell, Baldock, Hertfordshire GBR"},
     {"Tim Saxton"=>"Ashwell, Baldock, Hertfordshire GBR"},
     {"Mark Powell"=>"Hayling Island, Hants GBR"},
     {"Isobel Walker"=>"Newport, RI USA"},
     {"Sam Littlejohn"=>"Worthing, West Sussex GBR"},
     {"Toby Lewis"=>"Wimborne, Dorset, UK GBR"}]},
 "Stanford Cardinal"=>
  {:color=>"White",
   :players=>
    [{"Kevin Laube"=>"San Diego, CA USA"},
     {"Carolyn Ortel"=>"Annapolis, MD USA"},
     {"Mateo Vargas"=>"Treasure Island, FL USA"},
     {"Haley Kirk"=>"Long Beach, CA USA"},
     {"Oliver Toole"=>"Santa Barbara, CA USA"},
     {"Hannah Burroughs"=>"Stanford, CA USA"}]},
 "Team Extreme"=>
  {:color=>"Gray",
   :players=>
    [{"Stuart McNay"=>"Boston, MA USA"},
     {"Michael Hession"=>"Chicago, IL USA"},
     {"Zachary Brown"=>"San Diego, CA USA"},
     {"Emmett Smith"=>"New Haven, CT USA"},
     {"Thomas Barrows"=>"St. Thomas, VI ISV"},
     {"Marla Menninger"=>"New York, NY USA"}]},
 "Team Trouble"=>
  {:color=>"Light Blue",
   :players=>
    [{"Benjamin Spiller"=>"Quincy, MA USA"},
     {"Anna Miniutti"=>"Quincy, MA USA"},
     {"Matt Allen"=>"Beverly, MA USA"},
     {"Andrew Schneider"=>"Marblehead, MA USA"},
     {"Mark Dinneen"=>"Milton, CT USA"},
     {"Janel Zarkowsky"=>"Annapolis, MD USA"}]},
 "The Boston Boom"=>
  {:color=>"Light Purple",
   :players=>
    [{"Billy Martin"=>"Riverton, NJ USA"},
     {"Sarah Whalen"=>"Westwood, MA USA"},
     {"Clinton Hayes"=>"East Haddam, CT USA"},
     {"Erin Pierce"=>"South Freeport, ME USA"},
     {"Bobby Martin"=>"Boston, MA USA"},
     {"Erin Kilcline"=>"Boston, MA USA"}]},
 "The Woonsocket Rockets"=>
  {:color=>"Magenta",
   :players=>
    [{"Justin Law"=>"Newport Beach, CA USA"},
     {"Jane Macky"=>"New York, NY USA"},
     {"Joel Hanneman"=>"Newport, RI USA"},
     {"Alexa Schuler"=>"Marblehead, MA USA"},
     {"Nick Ewenson"=>"Newport, RI USA"},
     {"Hilary Wiech"=>"Newport, RI USA"}]},
 "Triple Action"=>
  {:color=>"Kelly Green",
   :players=>
    [{"John Pearce"=>"Washington, DC USA"},
     {"Chris Klevan"=>"Norfolk, VA USA"},
     {"Brian Clancy"=>"Ithaca, NY USA"},
     {"Zach Goldman"=>"New York, NY USA"},
     {"Trevor Moore"=>"North Pomfret, VT USA"},
     {"Mandi Markee"=>"Del Mar, CA USA"}]},
 "Triple Double"=>
  {:color=>"Teal",
   :players=>
    [{"Christopher Mace"=>"Newport Beach, CA USA"},
     {"Hilary Kenyon"=>"Wayzata, MN USA"},
     {"Samuel Stokes"=>"Norfolk, VA USA"},
     {"Brooks Clark"=>"Newport Beach, CA USA"},
     {"James Silsby"=>"Costa Mesa, CA USA"},
     {"Sally Mace"=>"Newport Beach, CA USA"}]},
 "Who Dat"=>
  {:color=>"Maroon",
   :players=>
    [{"John Potts"=>"New Orleans, LA USA"},
     {"Keisa Pearson"=>"Annapolis, MD USA"},
     {"Mitchell Hall"=>"New Orleans, LA USA"},
     {"Jennifer Watkins"=>"New Orleans, LA USA"},
     {"Matthew  Duggan"=>"Boston, MA USA"},
     {"Catherine Swanson"=>"Charleston, SC USA"}]},
 "Bye"=>
  {:color=>"Red",
   :players=>
   []}
}.each do |team, info|
  t = Team.create(:name => team, :color => info[:color])
  
  info[:players].each do |p|
    t.players.create(p)
  end
end

bow = 1
['Black', 'Orange', 'Yellow', 'Grey', 'Red', 'White', 'Pink', 'Blue'].each do |color|
  fleet = Fleet.create(:color => color)
  3.times do
    fleet.boats.create(:bow => bow)
    bow = bow + 1
  end
end
