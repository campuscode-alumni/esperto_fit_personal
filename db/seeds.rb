# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unit = Unit.create(name: 'Santana')
Unit.create(name: 'Paulista')

customer_acc = Account.create(document: '12345678900', email: 'customer@email.com', password: '123456', type: 'Customer', unit: unit)
personal_acc = Account.create(document: '12345678910', email: 'personal@email.com', password: '123456', type: 'Personal', unit: unit)

customer_prof = Profile.create(account: customer_acc, first_name: 'Customer', last_name: 'Smith', address: 'Customer Street', date_of_birth: '01-01-1970', contact: '123-456-789', gender: 'male', nickname: 'CustomerNick', payment_method: 'Credito')
personal_prof = Profile.create(account: personal_acc, first_name: 'Personal', last_name: 'Smith', work_document: '123.456.789.10', address: 'Personal Street', date_of_birth: '01-01-1970', contact: '123-456-789', gender: 'male', nickname: 'PersonalNick', payment_method: 'Credito')

schedule = Schedule.create(date: '12/11/2020', price: '50', unit: unit, start: 10, finish: 13, personal: personal_acc)
schedule.create_appointments



