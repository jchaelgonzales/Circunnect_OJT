# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: 'chriscross', email: 'chris@circunnect.com', password: 'password', first_name: 'chris', last_name: 'cruz', month: 'June', day: '3', year: '1990', gender: 'Male', blood_type: 'A-', address_street: 'Washington St.', address_city: 'Antipolo City', address_province: 'Rizal', contact_info: '09123456789', avatar: '', user_type: 'Donor', user_status: 'Active')