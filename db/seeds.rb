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
end
