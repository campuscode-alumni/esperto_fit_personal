# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

customer_acc = Account.create(name: 'customer_account', email: 'customer@email.com', password: '123456', type: 'Customer')
personal_acc = Account.create(name: 'personal_account', email: 'personal@email.com', password: '123456', type: 'Personal')

customer_prof = Profile.create(first_name: 'Customer', last_name: 'Smith', document: '123.456.789.10', address: 'Customer Street', date_of_birth: '01-01-1970', contact: '123-456-789', gender: 'male', nickname: 'CustomerNick', payment_method: 'Credito')
personal_prof = Personal_prof = Profile.create(first_name: 'Personal', last_name: 'Smith', document: '123.456.789.10', address: 'Personal Street', date_of_birth: '01-01-1970', contact: '123-456-789', gender: 'male', nickname: 'PersonalNick', payment_method: 'Credito', work_document: '49-49-49')

unit = Unit.create(name: 'Paulista')
schedule = Schedule.create(date: '12-11-2020', price: '50', unit: unit, start: 12, finish: 18, personal: personal_acc)
schedule.create_appointments

profile = Profile.create(first_name: 'Jeová', last_name: 'Jesus', document: '12345678900', date_of_birth: '12-11-1992', gender: 'male', address: 'Av. Paulista, 1374', contact: '11998856633', nickname: 'Jeovazinho', payment_method: 'Débito em conta', work_document: '12345678900', account: personal_acc)