city = City.create!(name: 'City')

user = User.create!(
  first_name: 'Foo', last_name: 'Bar',
  phone_number: '+79998887766', email: 'foo@bar.com',
  birthdate: 20.years.ago,
  city: city, street_name: 'Street name',
  house_number: '1a', apartment_number: 1, notes: 'Notes'
)

user.update!(api_token: 'foobar')

category = Category.create!(
  name: 'Category',
  description: 'Description',
  icon: 'icon'
)
