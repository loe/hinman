# coding: utf-8
{
  
  "San Diego Yacht Club" => [
    "Mikee Anderson Mitterling",
    "David Hughes",
    "Adam Roberts",
    "Nick Martin",
    "Brennan Clark",
    "Molly O'Bryan"
  ],
  
  "Yale Corinthian Yacht Club" => [
    "Zachary Brown",
    "Stuart McNay",
    "Thomas Barrows",
    "Emmet Smith",
    "Maria Menninger",
    "Michael Hession"
  ],
  
  "New York Yacht Club" => [
    "Amanda Callahan",
    "Clayton Bischoff",
    "Peter Levesque",
    "Carrie Amarante",
    "Caroline Hall Levesque",
    "Colin Merrick"
  ],
  
  "Hyannis Yacht Club" => [
    "Matthew Duggan",
    "Vanessa DeCollibus",
    "Cardwell Potts",
    "Alyssa Aitken",
    "John B. Potts",
    "Keisha Pearson"
  ],
  
  "Rhode Island Team Racing Association" => [
    "Joel Hanneman",
    "Alexa Schuler",
    "Justin Law",
    "Lyndsey Gibbons-Neff",
    "Brian Kamilar",
    "Megan Riddle"
  ],
  
  "Eastern Yacht Club" => [
    "Clinton Hayes",
    "Christine Bletzer",
    "Mark Dinneen",
    "Janel Zarkowsky",
    "Ben Quatromoni",
    "Emily Anderson"
  ],
  
  "College of Charleston" => [
    "Brendan Healy",
    "Meghan Jordan",
    "Joel Labuzetta",
    "Corinna Decollibus",
    "Chris Lash",
    "Russ O'Reilly"
  ],
  
  "West Kirby Sailing Club" => [
    "Dom Johnson",
    "Tom Foster",
    "Debs Steele",
    "Andy Cornah",
    "Hamish Walker",
    "Ben Field"
  ],
  
  "Eastern Yacht Club/Little Egg Harbor Yacht Club" => [
    "Clay Johnson",
    "Elyse Dolbec",
    "Sean Doyle",
    "Susan Doyle",
    "Scott Hogan",
    "Megan Watson"
  ],
  
  "Royal Bermuda Yacht Club/Newport Harbor Yacht Club" => [
    "Alexander Kirkland",
    "Catherine Swanson",
    "Carly Chamberlain",
    "Ashley Phillips",
    "David Siegal",
    "Jesse Kirkland"
  ],
  
  "Fingerlakes Yacht Club" => [
    "Trevor Moore",
    "Mandi Markee",
    "Brian Clancy",
    "Chris Klevan",
    "Lee Sackett",
    "Oscar Barney"
  ],
  
  "Treasure Island Sailing Center" => [
    "Kevin Richards",
    "Avery Patton",
    "Natasha Baker",
    "Dan Altreuter",
    "Linda Stephan",
    "Patrick Whitmarsh"
  ],
  
  "Newport Harbor Yacht Club" => [
    "James Silsby",
    "Garrett Woodworth",
    "Killarney Loufek",
    "Stephanie Adams",
    "Whitney Loufek",
    "Andy Beeckman"
  ],
  
  "North Shore Trouble" => [
    "Benjamin Spiller",
    "Anna Miniutti",
    "Matt Allen",
    "Andrew Schneider",
    "Charles Higgins",
    "Maureen Castrucio"
  ],
  
  "St. Francis Yacht Club" => [
    "Harrison Turner",
    "Jessica Barhydt",
    "Edward Conrad",
    "Kristin Maberry",
    "Holt Condon",
    "Melanie Roberts"
  ],
  
  "All-Stars" => [
    "Ben Ainsle",
    "Russell Coutts",
    "Dennis Connor",
    "Robert Scheidt",
    "Sir Thomas Lipton",
    "Paul Elvstrøm"
  ]

}.each do |team, players|
  t = Team.create(:name => team)
  
  players.each do |p|
    t.players.create(:name => p)
  end
end
