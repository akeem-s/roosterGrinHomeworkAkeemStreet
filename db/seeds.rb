# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'patients.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  user = User.new
  user.first_name = row['first_name']
  user.last_name = row['last_name']
  user.phone_number = row['phone_number']
  user.email = row['email']
  user.street_address = row['street_address']
  user.city = row['city']
  user.state = row['state']
  user.zip = row['zip']
  user.save
  puts "#{user.first_name} saved"
end

puts "There are now #{User.count} users in the users table"
