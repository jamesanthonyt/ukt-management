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
puts 'Finished!'
