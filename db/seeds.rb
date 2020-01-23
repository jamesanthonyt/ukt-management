# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Theatre.destroy_all

puts 'Creating theatres...'
theatre_attributes = [
  {
    name: 'Theatre Royal Somewhere',
    managed_by: 'Independent',
    af_source_org_id: 1023,
    notes: 'These guys are great!'
  },
  {
    name: 'The Somewhere Palace',
    managed_by: '',
    af_source_org_id: 1027,
    notes: 'These guys are annoying'
  },
  {
    name: 'Studio Random',
    managed_by: '',
    af_source_org_id: 1030,
    notes: 'Require some hand holding'
  }
]
Theatre.create!(theatre_attributes)
puts 'Finished creating theatres!'

theatre_one = Theatre.find(1)
theatre_two = Theatre.find(2)
theatre_three = Theatre.find(3)

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
    theatre_id: theatre_one.id
  },
  {
    name: 'Studio',
    space_type: 'Studio Space',
    capacity: 145,
    programme: 'More produced in-house',
    grouping: 1,
    include: true,
    notes: '',
    theatre_id: theatre_two.id
  },
  {
    name: 'Cinema 1',
    space_type: 'Cinema',
    capacity: 340,
    programme: 'Only presented/toured',
    grouping: 4,
    include: true,
    notes: '',
    theatre_id: theatre_three.id
  }
]
PerformanceSpace.create!(performance_space_attributes)
puts 'Finished creating performance spaces!'

puts 'Creating audience finder lookup venues...'
af_venue_lookup_attributes = [
  {
    af_source_org_id: theatre_one.af_source_org_id,
    af_venue: 'Space A'
  },
  {
    af_source_org_id: theatre_one.af_source_org_id,
    af_venue: 'Space B'
  },
  {
    af_source_org_id: theatre_two.af_source_org_id,
    af_venue: 'Space A'
  },
  {
    af_source_org_id: theatre_two.af_source_org_id,
    af_venue: 'Space B'
  },
  {
    af_source_org_id: theatre_three.af_source_org_id,
    af_venue: 'Space A'
  },
  {
    af_source_org_id: theatre_three.af_source_org_id,
    af_venue: 'Space B'
  }
]
AfVenueLookup.create!(af_venue_lookup_attributes)
puts 'Finished creating audience finder lookup venues!'
