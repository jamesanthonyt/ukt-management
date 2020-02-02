# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
PerformanceSpace.destroy_all
Theatre.destroy_all
AfVenue.destroy_all
SourceOrg.destroy_all

puts 'Creatine source orgs...'
src_org_attributes = [
  {
    id: 1023,
    name: 'Somewhere Theatre'
  },
  {
    id: 1027,
    name: 'The Palace'
  },
  {
    id: 1030,
    name: 'The Studio'
  }
]
SourceOrg.create!(src_org_attributes)
puts 'Finished creating source orgs!'

puts 'Creating theatres...'
theatre_attributes = [
  {
    name: 'Theatre Royal Somewhere',
    management: 'Independent',
    source_org_id: 1023,
    include: true,
    notes: 'These guys are great!'
  },
  {
    name: 'The Somewhere Palace',
    management: 'ATG',
    source_org_id: 1027,
    include: true,
    notes: 'These guys are annoying'
  },
  {
    name: 'Studio Random',
    management: 'SellaDoor',
    source_org_id: 1030,
    include: true,
    notes: 'Require some hand holding'
  }
]
Theatre.create!(theatre_attributes)
puts 'Finished creating theatres!'

puts 'Creating performance spaces...'
performance_space_attributes = [
  {
    name: 'Main space',
    space_type: 'Main Auditorium',
    capacity: 600,
    programme: 'Only produced in-house',
    grouping: 1,
    include: true,
    notes: '',
    theatre_id: Theatre.first.id
  },
  {
    name: 'Studio',
    space_type: 'Studio Space',
    capacity: 145,
    programme: 'More produced in-house',
    grouping: 1,
    include: true,
    notes: '',
    theatre_id: Theatre.first.id
  },
  {
    name: 'Cinema 1',
    space_type: 'Cinema',
    capacity: 340,
    programme: 'Only presented/toured',
    grouping: 1,
    include: true,
    notes: '',
    theatre_id: Theatre.first.id
  }
]
PerformanceSpace.create!(performance_space_attributes)
puts 'Finished creating performance spaces!'

puts 'Creating AF venues...'
af_venue_attributes = [
  {
    source_org_id: 1023,
    name: 'Space A'
  },
  {
    source_org_id: 1023,
    name: 'Space B'
  },
  {
    source_org_id: 1027,
    name: 'Space A'
  },
  {
    source_org_id: 1027,
    name: 'Space B'
  },
  {
    source_org_id: 1030,
    name: 'Space A'
  },
  {
    source_org_id: 1030,
    name: 'Space B'
  }
]
AfVenue.create!(af_venue_attributes)
puts 'Finished creating AF venues!'
