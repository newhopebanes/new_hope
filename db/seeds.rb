#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require Rails.root.join("db/link_seeds.rb")
[
  {:name => "etti",  :password => 'foobar', :password_confirmation => 'foobar'}
].each do |attributes|
   User.find_or_create_by_name(attributes)
  end

[
  {:title => "Monday",    :position => 1},
  {:title => "Tuesday",   :position => 2},
  {:title => "Wednesday", :position => 3},
  {:title => "Thursday",  :position => 4},
  {:title => "Friday",    :position => 5},
  {:title => "Saturday",  :position => 6},
  {:title => "Sunday",    :position => 7}
].each do |attributes|
   Day.find_or_create_by_title(attributes)
  end

[
  {:title => "Email", :position => 1},
  {:title => "Phone", :position => 2}
].each do |attributes|
   Contact.find_or_create_by_title(attributes)
  end

[
  {:title => "Word", :position => 1},
  {:title => "PDF", :position => 2},
  {:title => "Text", :position => 3}

].each do |attributes|
   DocumentType.find_or_create_by_title(attributes)
  end

[
  {:title => "Fixed",   :position => 1},
  {:title => "Dynamic", :position => 2}
].each do |attributes|
   OffsetType.find_or_create_by_title(attributes)
  end

[
  {:title => "Single",   :position => 1},
  {:title => "Recurring", :position => 2}
].each do |attributes|
   DateType.find_or_create_by_title(attributes)
  end


[
  {:title => "One",    :position => 1},
  {:title => "Two",    :position => 2},
  {:title => "Three",  :position => 3},
  {:title => "Four",   :position => 4},
  {:title => "Five",   :position => 5},
  {:title => "Six",    :position => 6},
  {:title => "Seven",  :position => 7},
  {:title => "Eight",  :position => 8},
  {:title => "Nine",   :position => 9},
  {:title => "Ten",    :position => 10},
  {:title => "Eleven", :position => 11},
  {:title => "Twelve", :position => 12}
].each do |attributes|
   FixedOffset.find_or_create_by_title(attributes)
  end

[
  {:title => "First",  :position => 1},
  {:title => "Second", :position => 2},
  {:title => "Third",  :position => 3},
  {:title => "Fourth", :position => 4},
].each do |attributes|
   DynamicOffset.find_or_create_by_title(attributes)
  end

[
  {:title => "Daily",      :position => 1},
  {:title => "Weekly",     :position => 2},
  {:title => "Bi-Weekly",  :position => 3},
  {:title => "Monthly",    :position => 4},
  {:title => "Bi-Monthly", :position => 5},
  {:title => "Yearly",     :position => 6}
].each do |attributes|
   Frequency.find_or_create_by_title(attributes)
  end

[
  {:title => "Day(s)",      :position => 1},
  {:title => "Week(s)",     :position => 2},
  {:title => "Month(s)",  :position => 3},
  {:title => "Year(s)",    :position => 4},
].each do |attributes|
   FixedFrequency.find_or_create_by_title(attributes)
  end

[
  {:title => "GP/Proffessional Referral", :position => 1},
  {:title => "Self Referral",             :position => 2},
  {:title => "Other",                     :position => 3},
].each do |attributes|
   Referral.find_or_create_by_title(attributes)
  end

  [
  {:title => "Emergency",  :position => 1},
  {:title => "Non-Emergency", :position => 2},
  {:title => "Specific",  :position => 3},
  {:title => "Young People",  :position => 4},
  {:title => "Adults",  :position => 5},
  {:title => "Older People",  :position => 6},
  {:title => "Family",  :position => 7},
  {:title => "Housing",  :position => 8},
  {:title => "Financial and Legal",  :position => 9},
  {:title => "Other", :position => 10},
].each do |attributes|
   LinkType.find_or_create_by_title(attributes)
  end

# Gets data from link_seeds.rb module
LinkSeeds.data.each do |attributes|
   Link.find_or_create_by_name(attributes)
  end

[
  {:action => "Create site", :area => "all", :user => "application", :description => "Creating site"}
].each do |attributes|
   Update.find_or_create_by_user(attributes)
  end

[

].each do |attributes|
   Link.find_or_create_by_name(attributes)
  end




