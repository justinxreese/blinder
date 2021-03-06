# Core Event & associated Blinds
event = Event.create title: 'Steel City Ruby 2014 RFP',
  blind_level: 0,
  info: File.read('db/texts/event_info.md')

personal_info = Blind.create event: event,
  level: 5,
  title: "Personal &amp; Contact Information",
  info: "Your identifying information is not available to the selection committee until the last round of evaluation and is important to have a means of contacting you. We will never share or publish your contact information without asking you directly.",
  position: 0

talk_info = Blind.create event: event,
  level: 1,
  title: "Talk Information",
  info: "The information in this section is the primary data used during proposal evaluation and selection. Please do not include identifying information in this section.",
  position: 1

balancing_info = Blind.create event: event,
  level: 2,
  title: "Balancing Information",
  info: "This information is not given to the selection committee until a late round in the selection process. It is used to provide contextual information about proposals and provides additional differentiation between similarly strong proposals.",
  position: 2

make_life_easier = Blind.create event: event,
  level: 10, #yeah. . . not really part of the evaluation process
  title: "Help Us Out",
  info: "This information is not used for talk selection, but it will to make our lives easier if your proposal is accepted. The members of the selection committee will not be given this information during the selection process.",
  position: 3

position = -1
def position(reset = false)
  position = -1 if reset
  position = position + 1
end

# Questions for the Blinds!
Question.create blind: personal_info, required: true, label: "Name", kind: "text", position: position(true)
Question.create blind: personal_info, required: true, label: "Email Address", kind: "email", position: position
Question.create blind: personal_info, required: true, label: "Phone Number", kind: "tel", position: position
Question.create blind: personal_info, required: true, label: "Bio", kind: "textarea", position: position
Question.create blind: personal_info, required: false, label: "Websites", kind: "text", position: position
Question.create blind: personal_info, required: false, label: "Twitter", kind: "text", position: position

Question.create blind: make_life_easier, required: true, label: "T-shirt cut", kind: "radio", values: "Mens,Womens", position: position, group: "shirt_cut"
Question.create blind: make_life_easier, required: true, label: "T-shirt size", kind: "radio", values: "XS,S,M,L,XL,2XL,3XL,4XL,5XL", position: position, group: "shirt_size"
Question.create blind: make_life_easier, required: true, label: "URL to a headshot or avatar", kind: "text", position: position(true)

Question.create blind: talk_info, required: true, label: "Talk Title", kind: "text", position: position(true)
Question.create blind: talk_info, required: true, label: "Talk Focus", kind: "radio", values: "Technical,People/Process,Hybrid/Other", position: position, group: "focus"
Question.create blind: talk_info, required: true, label: "Intended Audience (technical level, background, etc)", kind: "textarea", position: position
Question.create blind: talk_info, required: true, label: "Talk Abstract", kind: "textarea", position: position
Question.create blind: talk_info, required: true, label: "Why would this talk be a good fit for the Steel City Ruby audience?", kind: "textarea", position: position

Question.create blind: balancing_info, required: false, label: "Previous Conference Speaking Experience", kind: "textarea", position: position(true)
Question.create blind: balancing_info, required: true, label: "Years of Ruby Experience", kind: "text", position: position
Question.create blind: balancing_info, required: true, label: "Do you have any current or past connections to the Western PA area? If so, what?", kind: "textarea", position: position
Question.create blind: balancing_info, required: false, label: "At which other conferences has this talk been presented?", kind: "textarea", position: position

# User records for members of the selection committee

# Admin users
admins = [
  { uid: 27784,  name: 'Jeremy Flores' },
  { uid: 159591, name: 'Paul Scarrone' },
  { uid: 553936, name: 'Chris Geihsler' }
]

admins.each do |admin|
  User.create uid: admin[:uid], name: admin[:name], role: 'admin', provider: 'github'
end

# Review users
reviewers = [
  { uid: 150839,  name: 'Justin Reese' },
  { uid: 197224,  name: 'Colin Dean' },
  { uid: 193874,  name: 'Carol Nichols' },
  { uid: 45143,   name: 'Daniel Buch' },
  { uid: 22186,   name: 'Justin Geibel' },
  { uid: 225823,  name: 'Bruce Adams' },
  { uid: 38176,   name: 'Marylou Lenhart' },
  { uid: 1543891, name: 'Jared Wilkerson' },
  { uid: 1873205, name: 'Zack Mance' },
  { uid: 1133473, name: 'Corey Purcell' },
  { uid: 1461735, name: 'Jean Lange' }
]

reviewers.each do |reviewer|
  User.create uid: reviewer[:uid], name: reviewer[:name], role: 'reviewer', provider: 'github'
end
