user = User.create!(
  first_name: 'Foo', last_name: 'Bar',
  phone_number: '+79998887766', email: 'foo@bar.com',
  address: 'Address', birthdate: 20.years.ago
)

user.update!(api_token: 'foobar')

category = Category.create!(
  name: 'Category',
  description: 'Description'
)
