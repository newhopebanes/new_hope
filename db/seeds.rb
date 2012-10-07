# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
[
  {:title => "Monday",     :position => 1},
  {:title => "Tuesday", :position => 2},
  {:title => "Wednesday",    :position => 3},
  {:title => "Thursday",  :position => 4},
  {:title => "Friday",  :position => 5},
  {:title => "Saturday",  :position => 6},
  {:title => "Sunday",  :position => 7}
].each do |attributes|
   Day.find_or_create_by_title(attributes)
  end
  
[
  {:title => "Email",     :position => 1},
  {:title => "Phone", :position => 2}
].each do |attributes|
   Contact.find_or_create_by_title(attributes)
  end
  
[
  {:title => "Daily",     :position => 1},
  {:title => "Weekly", :position => 2},
  {:title => "Bi-Weekly",    :position => 3},
  {:title => "Monthly",  :position => 4},
  {:title => "Bi-Monthly",  :position => 5},
  {:title => "Yearly",  :position => 6}
].each do |attributes|
   Frequency.find_or_create_by_title(attributes)
  end
  
[
  {:title => "GP/Proffessional Referral",     :position => 1},
  {:title => "Self Referral", :position => 2},
  {:title => "Other",    :position => 3},
].each do |attributes|
   Referral.find_or_create_by_title(attributes)
  end
    
[
  {:title => "Adults (18+)",     :position => 1},
  {:title => "Under 18's", :position => 2},
  {:title => "Men Only",    :position => 3},
  {:title => "Women Only",  :position => 4},
  {:title => "People with mental health issues",  :position => 5},
  {:title => "People with learning dificulties",  :position => 6},
  {:title => "People with drug or alcohol issues",  :position => 7},
  {:title => "People with homelessness issues",  :position => 8},
  {:title => "Carers",  :position => 9},
  {:title => "Carers for those with mental health issues",  :position => 10},
  {:title => "Any vulnerable person",  :position => 11},
  {:title => "Anyone",  :position => 12},
  {:title => "Other",  :position => 13}
].each do |attributes|
   Target.find_or_create_by_title(attributes)
  end
  
[
  {:title => "Arts and Crafts",     :position => 1},
  {:title => "Sports", :position => 2},
  {:title => "Outdoors",    :position => 3},
  {:title => "Creative",  :position => 4},
  {:title => "Wellbeing",  :position => 5},
  {:title => "Social",  :position => 6},
  {:title => "Faith",  :position => 7},
  {:title => "Food",  :position => 8},
  {:title => "Learning",  :position => 9},
  {:title => "Exersise",  :position => 10},
  {:title => "Lifestyle",  :position => 11},
  {:title => "Other",  :position => 12}
].each do |attributes|
   Tag.find_or_create_by_title(attributes)
  end
  

