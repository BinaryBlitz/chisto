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
  name: 'Name',
  description: 'Description',
  icon: 'icon'
)

item = Item.create!(name: 'Name', category: category, icon: 'icon')

treatment = Treatment.create!(name: 'Name', description: 'Description')

laundry = Laundry.create!(
  name: 'Name', description: 'Description',
  logo: 'logo', image: 'image', category: 'premium'
)

laundry.laundry_treatments.create!(treatment: treatment, price: 100)
