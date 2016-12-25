image = File.open(Rails.root.join('public', 'blank.jpg'))

city = City.create!(name: 'City', latitude: 0.0, longitude: 0.0)

user = User.create!(
  first_name: 'Foo', last_name: 'Bar',
  phone_number: '+79998887766', email: 'foo@bar.com',
  birthdate: 20.years.ago,
  city: city, street_name: 'Street name',
  house_number: '1a', apartment_number: 1,
  notes: 'Notes', contact_number: '+79998887766'
)

user.update!(api_token: 'foobar')

category = Category.create!(
  name: 'Name',
  description: 'Description',
  icon: image,
  color: '#000000',
  featured: false
)

item = Item.create!(
  category: category,
  name: 'Name',
  description: 'Description',
  icon: image
)

treatment = item.treatments.create!(name: 'Name', description: 'Description')

laundry = Laundry.create!(
  name: 'Name', description: 'Description', city: city,
  logo: image, background_image: image,
  email: 'foo@bar.com', password: 'qwerty123', enabled: true,
  minimum_collection_time: 12, order_processing_time: 24
)

schedule = Schedule.create!([
  { laundry: laundry, day_of_the_week: :mon, opens_at: '9:00', closes_at: '18:00' },
  { laundry: laundry, day_of_the_week: :tue, opens_at: '9:00', closes_at: '18:00' },
  { laundry: laundry, day_of_the_week: :wed, opens_at: '9:00', closes_at: '18:00' },
  { laundry: laundry, day_of_the_week: :thu, opens_at: '9:00', closes_at: '18:00' },
  { laundry: laundry, day_of_the_week: :fri, opens_at: '9:00', closes_at: '18:00' },
  { laundry: laundry, day_of_the_week: :sat, opens_at: '10:00', closes_at: '17:00' },
  { laundry: laundry, day_of_the_week: :sun, opens_at: '10:00', closes_at: '17:00' }
])

laundry_item = laundry.laundry_items.create!(item: item, decoration_multiplier: 1.5)
laundry_treatment = laundry.laundry_treatments.create!(treatment: treatment, price: 100)

rating = Rating.create!(laundry: laundry, user: user, value: 5, content: 'Content', verified: true)

order = Order.create!(
  user: user, laundry: laundry,
  street_name: user.street_name, house_number: user.house_number,
  apartment_number: user.apartment_number, contact_number: user.contact_number,
  email: user.email,
  line_items_attributes: [{ laundry_treatment: laundry_treatment, quantity: 1 }]
)

admin = Admin.create!(email: 'foo@bar.com', password: 'qwerty123')
