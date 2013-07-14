#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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
  {:title => "Social-Other", :position => 4},
].each do |attributes|
   LinkType.find_or_create_by_title(attributes)
  end

[
  {:action => "Create site", :area => "all", :user => "application", :description => "Creating site"}
].each do |attributes|
   Update.find_or_create_by_user(attributes)
  end

[
  { :name => "Samaritans",
    :url => "http://www.samaritans.org/",
    :phone => "08457 90 90 90 ",
    :location => "National",
    :opening => "24/7 365 days of the year ",
    :text => "Support by telephone, email, letter.",
    :link_type_id => 1
  },
  { :name => "Bath & District Samaritans",
    :url => "http://www.bathsamaritans.org/",
    :phone => "01225 460888",
    :location => "BANES",
    :opening => "",
    :text => "Support by telephone, email, letter or face to face in Bath.",
    :link_type_id => 1
  },
  { :name => "Intensive Services",
    :url => "http://www.awp.nhs.uk/services/community/intensive-services/",
    :phone => "01225 362700",
    :location => "BANES",
    :opening => "24/7 365 days of the year",
    :text => "Assessments for those experiencing a mental health crisis. Assessments will be given within 4 hours of referral. This service is for use of people over the age of 18.",
    :link_type_id => 1
  },
  { :name => "Women’s Aid",
    :url => "http://www.womensaid.org.uk/",
    :phone => "0808 2000 247",
    :location => "National/Local",
    :opening => "24/7 365 days of the year",
    :text => "Domestic abuse helpline.",
    :link_type_id => 1
  },
  { :name => "Saneline",
    :url => "http://www.sane.org.uk/home",
    :phone => "0845 767 8000",
    :location => "National",
    :opening => "Every day 6pm – 11pm",
    :text => "Out of hours emotional support helpline for those affected by mental health issues, inclusive of clients, carers, supporters, friends and family.",
    :link_type_id => 2
  },
  { :name => "Bipolar UK",
    :url => "http://www.bipolaruk.org.uk/",
    :phone => "020 7931 6480",
    :location => "London Based – Local Services available",
    :opening => "",
    :text => "Provide a range of services to enable people affected by bipolar and associated illnesses to take control of their lives. Self-help groups available in Bath.",
    :link_type_id => 3
  },
  { :name => "Community Arts Therapy Project (CAT)",
    :url => "http://www.community-arts-therapies.org.uk/",
    :phone => "07906 699660",
    :location => "BANES",
    :opening => "",
    :text => "A small, local charity that aims to improve the everyday lives of those affected by mental health issues through the use of Arts Therapies using Art, Drama, Dance Movement and Music Therapies to promote social inclusion, challenge stigma and discrimination and enhance well-being for all. Also work with Carers.",
    :link_type_id => 1},
].each do |attributes|
   Link.find_or_create_by_name(attributes)
  end




